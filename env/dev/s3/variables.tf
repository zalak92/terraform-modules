variable "region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
}

variable "bucket_name" { 
  description = "Globally unique S3 bucket name"
  type = string 
  }
variable "enable_versioning" { 
  description = "Enable versioning"
  type = bool
  default = true 
  }
variable "enable_lifecycle" { 
  description = "Enable lifecycle for non-current versions"
  type = bool
  default = false 
  }
variable "noncurrent_expiration_days" { 
  description = "Retention days"
  type = number
  default = 30 
  }
variable "sse_algorithm" {
  description = "AES256 or aws:kms"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be AES256 or aws:kms"
  }
}
variable "kms_key_id" { 
  description = "KMS key when using aws:kms"
  type = string
  default = "" 
  }
variable "tags" { 
  description = "Tags map"
  type = map(string)
  default = {} 
  }