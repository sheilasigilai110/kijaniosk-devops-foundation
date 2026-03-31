#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/kijanikiosk-provision.log"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

success() {
  echo "[PASS] $1" | tee -a "$LOG_FILE"
}

error() {
  echo "[FAIL] $1" | tee -a "$LOG_FILE"
  exit 1
}

log "Starting KijaniKiosk provisioning..."

# =================================
# Expected dirty conditions
# =================================
# - Users already exist (kk-api, kk-payments, kk-logs)
# - Group kijanikiosk already exists
# - UFW already has rules
# - Directories may already exist with wrong permissions

# =================================
# Phase 1: Package Management
# =================================
log "Phase 1: Package Management"

apt-get update -y
apt-get install -y acl ufw

success "Packages installed"

# =================================
# Phase 2: Users & Groups
# =================================
log "Phase 2: Users & Groups"

for user in kk-api kk-payments kk-logs; do
  if id "$user" &>/dev/null; then
    log "User exists: $user"
  else
    useradd -r -s /usr/sbin/nologin "$user"
    log "Created user: $user"
  fi
done

if getent group kijanikiosk > /dev/null; then
  log "Group exists: kijanikiosk"
else
  groupadd kijanikiosk
  log "Created group: kijanikiosk"
fi

usermod -aG kijanikiosk kk-api
usermod -aG kijanikiosk kk-payments
usermod -aG kijanikiosk kk-logs

success "Users and groups configured"

# =================================
# Phase 3: Directories & Permissions
# =================================
log "Phase 3: Directory Structure & Permissions"

mkdir -p /opt/kijanikiosk/{config,shared/logs,health}

chown -R root:kijanikiosk /opt/kijanikiosk
chown -R kk-api:kijanikiosk /opt/kijanikiosk/shared
chown -R kk-logs:kijanikiosk /opt/kijanikiosk/health

chmod 750 /opt/kijanikiosk
chmod 750 /opt/kijanikiosk/config
chmod 770 /opt/kijanikiosk/shared
chmod 770 /opt/kijanikiosk/shared/logs
chmod 750 /opt/kijanikiosk/health

# Reset and apply ACLs
setfacl -bR /opt/kijanikiosk/shared/logs || true

setfacl -m u:kk-api:rwx /opt/kijanikiosk/shared/logs
setfacl -m u:kk-payments:rx /opt/kijanikiosk/shared/logs
setfacl -m u:kk-logs:rwx /opt/kijanikiosk/shared/logs

# Default ACLs (for logrotate)
setfacl -d -m u:kk-api:rwx /opt/kijanikiosk/shared/logs
setfacl -d -m u:kk-payments:rx /opt/kijanikiosk/shared/logs
setfacl -d -m u:kk-logs:rwx /opt/kijanikiosk/shared/logs

success "Directories and ACLs configured"

# =================================
# Phase 4–8 placeholders
# =================================
log "Phase 4: Configuration Files (TODO)"
# Phase 4: Configuration Files
log "Phase 4: Configuration Files"

mkdir -p /opt/kijanikiosk/config

# API config
cat <<EOF > /opt/kijanikiosk/config/api.env
PORT=3000
ENV=production
EOF

# Payments config
cat <<EOF > /opt/kijanikiosk/config/payments-api.env
PORT=3001
ENV=production
EOF

# Permissions
chown kk-api:kijanikiosk /opt/kijanikiosk/config/api.env
chown kk-payments:kijanikiosk /opt/kijanikiosk/config/payments-api.env
chmod 640 /opt/kijanikiosk/config/*.env

success "Configuration files created"
log "Phase 5: Firewall (TODO)"
# Phase 5: Firewall
log "Phase 5: Firewall"

ufw --force reset
ufw default deny incoming
ufw default allow outgoing

ufw allow 22/tcp comment 'Allow SSH'
ufw allow 80/tcp comment 'Allow HTTP'

# Allow internal access to payments
ufw allow from 127.0.0.1 to any port 3001 comment 'Allow local access to payments'

# Allow monitoring subnet
ufw allow from 10.0.1.0/24 to any port 3001 comment 'Monitoring access'

# Deny external
ufw deny 3001 comment 'Block external payments access'

ufw --force enable

success "Firewall configured"
log "Phase 6: systemd Units (TODO)"
# Phase 6: systemd Units
log "Phase 6: systemd Units"

# ----------------------
# kk-api.service
# ----------------------
cat <<EOF > /etc/systemd/system/kk-api.service
[Unit]
Description=KijaniKiosk API Service
After=network.target

[Service]
User=kk-api
Group=kijanikiosk
EnvironmentFile=/opt/kijanikiosk/config/api.env
ExecStart=/usr/bin/python3 -m http.server 3000
Restart=always

# Hardening
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=full
ProtectHome=true

[Install]
WantedBy=multi-user.target
EOF

# ----------------------
# kk-payments.service
# ----------------------
cat <<EOF > /etc/systemd/system/kk-payments.service
[Unit]
Description=KijaniKiosk Payments Service
After=network.target kk-api.service
Wants=kk-api.service

[Service]
User=kk-payments
Group=kijanikiosk
EnvironmentFile=/opt/kijanikiosk/config/payments-api.env
ExecStart=/usr/bin/python3 -m http.server 3001
Restart=always

# STRONGER HARDENING (important for <2.5 score)
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true
RestrictAddressFamilies=AF_INET AF_INET6
LockPersonality=true
MemoryDenyWriteExecute=true

[Install]
WantedBy=multi-user.target
EOF

# ----------------------
# kk-logs.service
# ----------------------
cat <<EOF > /etc/systemd/system/kk-logs.service
[Unit]
Description=KijaniKiosk Logging Service
After=network.target

[Service]
User=kk-logs
Group=kijanikiosk
ExecStart=/usr/bin/tail -F /opt/kijanikiosk/shared/logs/app.log
Restart=always

# Hardening
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=full
ProtectHome=true

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
systemctl daemon-reexec
systemctl daemon-reload

# Enable services
systemctl enable kk-api
systemctl enable kk-payments
systemctl enable kk-logs

# Start services (safe even if they fail)
systemctl restart kk-api || true
systemctl restart kk-payments || true
systemctl restart kk-logs || true

success "systemd services configured"
log "Phase 7: Logging (TODO)"
# Phase 7: Logging & Logrotate
# Phase 7: Logging & Logrotate
log "Phase 7: Logging & Logrotate"

# Ensure logs directory
mkdir -p /opt/kijanikiosk/logs
chown kk-logs:kijanikiosk /opt/kijanikiosk/logs
chmod 750 /opt/kijanikiosk/logs

# Create logrotate config
cat > /etc/logrotate.d/kijanikiosk <<EOF
/opt/kijanikiosk/logs/*.log {
    daily
    missingok
    rotate 7
    compress
    delaycompress
    notifempty
    create 640 kk-logs kijanikiosk
    sharedscripts
    postrotate
        systemctl reload rsyslog >/dev/null 2>&1 || true
    endscript
}
EOF

# Validate logrotate config
if sudo logrotate --debug /etc/logrotate.d/kijanikiosk >/dev/null 2>&1; then
    success "Logrotate config validated"
else
    error "Logrotate config failed validation"
fi
success "Logging and logrotate configured"
log "Phase 8: Monitoring (TODO)"
# Phase 8: Health Checks
# Phase 8: Monitoring
log "Phase 8: Monitoring"

# Ensure health directory exists
mkdir -p /opt/kijanikiosk/health
chown kk-logs:kijanikiosk /opt/kijanikiosk/health
chmod 750 /opt/kijanikiosk/health

# Check service health (example: kk-api on port 3000, kk-payments on port 3001)
api_status=$(timeout 2 bash -c "echo >/dev/tcp/localhost/3000" 2>/dev/null && echo '"ok"' || echo '"down"')
payments_status=$(timeout 2 bash -c "echo >/dev/tcp/localhost/3001" 2>/dev/null && echo '"ok"' || echo '"down"')

# Write structured JSON to last-provision.json
cat > /opt/kijanikiosk/health/last-provision.json <<EOF
{
  "timestamp": "$(date -Is)",
  "kk-api": $api_status,
  "kk-payments": $payments_status
}
EOF

# Set ownership and permissions
chown kk-logs:kijanikiosk /opt/kijanikiosk/health/last-provision.json
chmod 640 /opt/kijanikiosk/health/last-provision.json

# Verify JSON file creation
if [[ -f /opt/kijanikiosk/health/last-provision.json ]]; then
    success "Health check JSON created"
else
    error "Failed to create health check JSON"
fi
success "Health checks complete; status saved to $HEALTH_FILE"

log "Provisioning complete"
