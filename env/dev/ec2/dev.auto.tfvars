aws_profile = "devvpc"
region      = "ap-south-1"

name = "dev-web-1"

architecture  = "x86_64"
instance_type = "t3.micro"


# Leave empty to auto-pick latest Amazon Linux 2023 AMI for the chosen architecture
ami_id = ""

subnet_id = "subnet-082d90c23595f4e83"
sg_ids    = ["sg-06574f33423f071a8"]

key_name             = "" # optional; if you want SSH, set an existing key pair name
iam_instance_profile = "" # optional; for SSM, we can add a role later
associate_public_ip  = true
volume_size          = 30

user_data = "" # optional script; leave empty for now

tags = {
  Environment = "dev"
  Owner       = "Zalak"
  App         = "web"
}