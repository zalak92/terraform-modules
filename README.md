# Terraform Modules – Personal Practice Repository
This repository contains reusable Terraform modules and environment-specific deployments for AWS resources.  
It is designed for learning, practicing Terraform workflows, and maintaining clean, modular IaC.

## 📁 Repository Structure

- **modules/** → reusable modules not tied to any specific environment  
- **env/dev/** → environment deployment files (backend, provider, main.tf, variables.tf, tfvars)

terraform-modules/
├── modules/                     # Base reusable modules (single source)
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── s3/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│   └── directory_service/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── env/
    └── dev/                    # Environment-specific wrappers
        ├── vpc/
        │   ├── provider.tf
        │   ├── variables.tf
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   └── dev.auto.tfvars
        │
        ├── ec2/
        │   ├── provider.tf
        │   ├── variables.tf
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   └── dev.auto.tfvars
        │
        |── s3/
        │   ├── provider.tf
        │   ├── variables.tf
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   └── dev.auto.tfvars
        |
        ├── directory_service/
        │   ├── provider.tf
        │   ├── variables.tf
        │   ├── locals.tf
        │   ├── main.tf
        │   ├── outputs.tf
        │   └── dev.auto.tfvars

## 🌐 Remote State Backend

Each environment uses AWS S3 + DynamoDB for state and locking.

Example backend (dev):

hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-zalak"
    key            = "<module-name>/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}