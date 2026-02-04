terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
backend "s3" {
    bucket         = "zalak-terraform-state"
    key            = "aws/dev/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
