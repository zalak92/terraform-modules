# S3 Module

Creates an S3 bucket with:
- Blocked public access
- Default SSE (AES256 by default; KMS optional)
- Optional versioning and lifecycle for non-current versions
- Tagged resources

## Inputs
- `bucket_name` (string) **required** (must be globally unique)
- `enable_versioning` (bool, default `true`)
- `enable_lifecycle` (bool, default `false`)
- `noncurrent_expiration_days` (number, default `30`)
- `sse_algorithm` (string, `AES256` or `aws:kms`, default `AES256`)
- `kms_key_id` (string, default `""`)
- `tags` (map(string), default `{}`)

## Outputs
- `storage_s3_bucket_id`
- `storage_s3_bucket_arn`
- `storage_s3_bucket_region`