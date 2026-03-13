#!/bin/bash

# Step 1: Go to terraform folder inside rock-paper-cloud folder
cd "$(dirname "$0")" || {
  echo "Failed to find terraform folder!"
  exit 1
}


# Step 2: Initialize terraform
echo "Running terraform init..."
terraform init

# Step 3: Apply terraform config automatically
echo "Applying terraform configuration..."
terraform apply -auto-approve

# Step 4: Get the VM public IP from terraform output
IP=$(terraform output -raw public_ip)
echo "VM Public IP: $IP"

# Step 5: SSH to the VM and check if HTTP server is running
echo "Checking if Python HTTP server is running on the VM..."

ssh -o ConnectTimeout=10 azureuser@$IP << 'ENDSSH'
ps aux | grep http.server | grep -v grep
if [ $? -ne 0 ]; then
  echo "HTTP server not running. Starting server..."
  cd ~
  nohup python3 -m http.server 8080 > /dev/null 2>&1 &
  echo "Server started on port 8080."
else
  echo "HTTP server is already running."
fi
ENDSSH

