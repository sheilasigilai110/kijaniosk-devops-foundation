#!/bin/bash
set -e

echo "=== Terraform Apply ==="
cd terraform
terraform init
terraform apply -auto-approve

echo "=== Extracting IPs ==="
API_IP=$(terraform output -raw api_ip)
PAYMENTS_IP=$(terraform output -raw payments_ip)
LOGS_IP=$(terraform output -raw logs_ip)

cd ../ansible

echo "=== Writing inventory ==="
cat > inventory.ini <<EOF
[api]
api ansible_host=$API_IP

[payments]
payments ansible_host=$PAYMENTS_IP

[logs]
logs ansible_host=$LOGS_IP

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/kijani-key.pem
EOF

echo "=== Running Ansible ==="
ansible-playbook -i inventory.ini kijanikiosk.yml

echo "=== Pipeline Complete ==="
