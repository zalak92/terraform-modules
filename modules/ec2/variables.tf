variable "name" {
  description = "Instance Name tag"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use. If empty, Amazon Linux 2023 AMI will be looked up."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
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

variable "tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}