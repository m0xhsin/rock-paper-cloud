# 🪨✋✌️ Rock Paper Scissors Cloud Deployment

This project deploys a simple Rock Paper Scissors game to a Virtual Machine on Microsoft Azure using **Terraform** and a **Bash script**. The game runs on a Python HTTP server and is accessible via any web browser.

---

## 🚀 How to Run the Project

1. **Navigate to the Terraform folder**:
   - Go to the `terraform` directory inside the `rock-paper-cloud` project.

2. **Run the deployment script**:
   - Double-click on `deploy_and_start.command` or run it from the terminal:
     ```bash
     ./deploy_and_start.command
     ```

   - This will:
     - Provision the required Azure resources
     - Deploy a Linux Virtual Machine
     - Upload the `index.html` file (your game)
     - Start a Python HTTP server to serve the game

3. **Access the Game**:
   - Once the script finishes, it will print a URL like this:
     ```
     ✅ Game deployed!
     Open your browser and go to: http://<your-public-ip>:8080
     ```

---

## 🧹 How to Destroy Everything

To clean up the Azure resources and stop incurring costs:

1. Inside the same `terraform` folder
2. Run the destruction script:
   ```bash
   ./destroy_and_cleanup.command
   ```

   This script will automatically remove:
   - The virtual machine
   - The public IP
   - The network interfaces
   - All associated resources

---

## 📈 Scalability Explained

This setup can be scaled by modifying the Terraform configuration to create **multiple virtual machines** instead of just one. These VMs can be placed behind a **load balancer** that distributes incoming traffic among them.

With this change:
- Multiple users can access the game simultaneously
- Traffic is balanced across VMs, preventing overload
- You fulfill the **"rapid elasticity"** criteria from the [NIST definition of cloud computing](https://csrc.nist.gov/publications/detail/sp/800-145/final)

Scalability can be achieved by using Terraform `count` or `for_each` to launch multiple instances and connecting them to a load balancer with a public IP.
This Terraform setup currently creates **one VM instance** running the game server.


- To scale up (e.g., run 3, 5, or 7 instances for load balancing or high availability), you can adjust the `count` parameter of the VM resource in the `main.tf` file.
- For example, change the VM resource block to:

  ```hcl
  resource "azurerm_linux_virtual_machine" "rps_vm" {
    count = 3 # Change this number to the desired number of VMs
    # other configuration...
  }
