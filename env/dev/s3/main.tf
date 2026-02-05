module "storage" {
  source = "../../../modules/s3"

  bucket_name               = var.bucket_name
  enable_versioning         = var.enable_versioning
  enable_lifecycle          = var.enable_lifecycle
  noncurrent_expiration_days = var.noncurrent_expiration_days
  sse_algorithm             = var.sse_algorithm
  kms_key_id                = var.kms_key_id
  tags                      = var.tags
}

output "storage_s3_bucket_id" {
  value       = module.storage.storage_s3_bucket_id
  description = "S3 bucket ID for dev"
}

output "storage_s3_bucket_arn" {
  value       = module.storage.storage_s3_bucket_arn
  description = "S3 bucket ARN for dev"
}