output "storage_s3_bucket_id" {
  description = "S3 bucket ID"
  value       = aws_s3_bucket.storage_bucket.id
}

output "storage_s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.storage_bucket.arn
}

output "storage_s3_bucket_region" {
  description = "Region where the bucket resides"
  value       = aws_s3_bucket.storage_bucket.region
}