region      = "ap-south-1"
aws_profile = "devvpc"

# Must be globally unique
bucket_name = "zalak-dev-terraform-artifacts"

# Cost/feature flags
enable_versioning  = true
enable_lifecycle           = false
noncurrent_expiration_days = 30

# Encryption
sse_algorithm = "AES256"   # change to "aws:kms" and set kms_key_id if you want KMS
kms_key_id    = ""         # e.g., "arn:aws:kms:ap-south-1:123456789012:key/xxxx" when using KMS

# Tags
tags = {
  Project     = "Terraform-Lab"
  Environment = "dev"
  Owner       = "Zalak"
  CostCenter  = "Practice"
}