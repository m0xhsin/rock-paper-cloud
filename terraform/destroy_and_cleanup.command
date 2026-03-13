#!/bin/bash

# Step 1: Go to terraform folder inside rock-paper-cloud folder
cd "$(dirname "$0")" || {
  echo "Failed to find terraform folder!"
  exit 1
}

# Step 2: Destroy all Terraform resources
echo "Destroying all Terraform-managed infrastructure..."
terraform destroy -auto-approve

# Step 3 (Optional): Clean up local Terraform files
echo "Cleaning up local Terraform files..."
rm -rf .terraform terraform.tfstate terraform.tfstate.backup .terraform.lock.hcl

echo "All resources destroyed and local files cleaned."
