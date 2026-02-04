variable "name" {
  description = "Instance Name tag"
  type        = string
}

variable "ami_id" {
  description = "Optional explicit AMI ID. If empty, an Amazon Linux 2023 AMI for the selected architecture will be looked up."
  type        = string
  default     = ""
}

variable "architecture" {
  description = "CPU architecture for the AMI: arm64 (Graviton) or x86_64 (Intel/AMD)."
  type        = string
  default     = "arm64"
  validation {
    condition     = contains(["arm64", "x86_64"], var.architecture)
    error_message = "architecture must be one of: arm64, x86_64"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  # Cheapest common options:
  # arm64 --> t4g.nano ; x86 --> t3.nano
  default     = "t4g.nano"
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance into"
  type        = string
}

variable "sg_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "EC2 key pair name (optional)"
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "Name of IAM instance profile to attach (optional)"
  type        = string
  default     = ""
}

variable "associate_public_ip" {
  description = "Associate a public IP (true/false)"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 8
}

variable "user_data" {
  description = "Optional user data script"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}