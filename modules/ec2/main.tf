# Lookup latest Amazon Linux 2023 AMI for the selected architecture, if ami_id not provided
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture] # "arm64" or "x86_64"
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

locals {
  resolved_ami = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux.id
}

resource "aws_instance" "ec2" {
  ami                         = local.resolved_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_ids
  key_name                    = var.key_name != "" ? var.key_name : null
  iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  associate_public_ip_address = var.associate_public_ip
  user_data                   = var.user_data != "" ? var.user_data : null

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge({ Name = var.name }, var.tags)
}