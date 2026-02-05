variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "enable_versioning" {
  description = "Enable object versioning"
  type        = bool
  default     = true
}

variable "enable_lifecycle" {
  description = "Enable lifecycle policy for non-current versions"
  type        = bool
  default     = false
}

variable "noncurrent_expiration_days" {
  description = "Days to retain non-current versions (if lifecycle enabled)"
  type        = number
  default     = 30
}

variable "sse_algorithm" {
  description = "Server-side encryption: AES256 (SSE-S3) or aws:kms (SSE-KMS)"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be AES256 or aws:kms"
  }
}

variable "kms_key_id" {
  description = "KMS Key ID or ARN when using aws:kms"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}