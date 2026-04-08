#!/bin/bash
set -e

echo "--- Starting KijaniKiosk IaC Pipeline ---"

# 1. Run Terraform
echo "Step 1: Provisioning Infrastructure..."
cd ../terraform
terraform apply -auto-approve

# 2. Extract IPs and update inventory
echo "Step 2: Updating Inventory..."
API_IP=$(terraform output -raw api_ip)
PAYMENTS_IP=$(terraform output -raw payments_ip)
LOGS_IP=$(terraform output -raw logs_ip)

cd ../ansible
cat <<EOF > inventory.ini
[kijanikiosk]
api ansible_host=${API_IP}
payments ansible_host=${PAYMENTS_IP}
logs ansible_host=${LOGS_IP}
EOF

# 3. Run Ansible
echo "Step 3: Configuring Servers..."
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini kijanikiosk.yml

echo "--- Pipeline Complete! ---"
