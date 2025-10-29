# Terraform_Crash_Course_Kannada
Complete Terraform Crash Course in Kannada — from basics to modules, workspaces, and AWS infrastructure automation using practical examples (VPC, EC2, S3, IAM, and more).

# 🌍 Terraform Crash Course in Kannada

This repository contains all the code examples and demo files used in my **Terraform Crash Course (in Kannada)**.  
We cover Terraform from the very basics — all the way to reusable modules, workspaces, and AWS automation.

🎥 **YouTube Video:** [](#)  
📦 **GitHub Repository:** [Terraform_Crash_Course_Kannada](https://github.com/iamkeerthik/Terraform_Crash_Course_Kannada)

---

## 🧱 Course Flow

### 1️⃣ Basics
- What is Terraform and why we use it
- Installation & setup
- Terraform directory structure
- Providers, Resources, Variables, Outputs

### 2️⃣ Hands-on Project
We build AWS infrastructure step by step:
- VPC with public & private subnets  
- EC2 instance  
- S3 bucket  
- IAM role and policy for EC2 → S3 access  

### 3️⃣ Modularization
- Create and use Terraform **modules**
- Input variables & outputs  
- Common tags using `locals`
- Conditional logic & `for_each`

### 4️⃣ Environment Management
- Use **tfvars** files for dev, stg, prod  
- Manage environments using **workspaces**

### 5️⃣ Advanced Concepts
- Built-in functions (e.g., `replace`, `merge`, `lookup`)
- `null_resource` with local & remote provisioners  
- Data sources & Terraform import  
- Version constraints ( `~>`, `>=`, etc. )

---

## 🧩 Example Commands

```bash
terraform init
terraform plan -var-file=env/dev.tfvars
terraform apply -var-file=env/dev.tfvars
terraform workspace new prod
terraform import aws_s3_bucket.example my-existing-bucket
