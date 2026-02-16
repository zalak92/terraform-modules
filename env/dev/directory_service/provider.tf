terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
    backend "s3" {
    bucket         = "zalak-terraform-state"
    key            = "aws/dev/directory_service/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    profile        = "devvpc"
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
