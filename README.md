# rock-paper-cloud
Deploys a Rock Paper Scissors web game to Microsoft Azure using Terraform. The script provisions a Linux VM, uploads the game, and runs a Python HTTP server to host it. The setup demonstrates Infrastructure as Code and can be scaled to multiple VMs with a load balancer for cloud elasticity.
# 🪨✋✌️ Rock Paper Scissors Cloud Deployment

![Python](https://img.shields.io/badge/Python-3-blue)
![Terraform](https://img.shields.io/badge/Terraform-IaC-blueviolet)
![Bash](https://img.shields.io/badge/Bash-Scripting-yellowgreen)
![Azure](https://img.shields.io/badge/Microsoft_Azure-Cloud-lightblue)
![License](https://img.shields.io/badge/License-MIT-green)

This project deploys a simple **Rock Paper Scissors** game to a **Microsoft Azure Virtual Machine** using **Terraform** and a **Bash script**. The game runs on a Python HTTP server and can be accessed via any web browser. It demonstrates **Infrastructure as Code, cloud deployment, and scalability**.

---

## 🚀 Features
- 🖥️ Deploy a Python-based Rock Paper Scissors game to Azure  
- ⚡ Automated provisioning of a Linux VM via Terraform  
- 🌐 Access the game through a public URL  
- 📈 Scalable setup with the option to deploy multiple VMs behind a load balancer  

---

## 🛠️ Tech Stack
- Python 3  
- Terraform  
- Bash scripting  
- Microsoft Azure  

---

## ▶️ How to Run
1. Navigate to the `terraform` folder in the project.
2. Run the deployment script:

```bash
./deploy_and_start.command
