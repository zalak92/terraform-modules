# Provider
region      = "ap-south-1"
aws_profile = "devvpc"

# Vault
vault_name        = "zalak-dev-backup-vault"
vault_kms_key_arn = null   # or "arn:aws:kms:ap-south-1:111122223333:key/xxxx"

# Plan & rule (daily at 02:00 UTC)
plan_name                 = "zalak-dev-backup-plan"
rule_name                 = "daily-02-utc"
schedule_cron             = "cron(0 2 * * ? *)"
start_window_minutes      = 60
completion_window_minutes = 180
enable_continuous_backup  = false

# Lifecycle (no cold storage; delete after 30 days)
lifecycle_cold_after_days   = 0
lifecycle_delete_after_days = 30

# Optional copy to other vaults/Regions (none for dev)
copy_to_vault_arns   = []
copy_cold_after_days = 0
copy_delete_after_days = 30

# Selection by tags (as requested)
selection_name      = "select-by-tag-env"
selection_tag_type  = "STRINGEQUALS"
selection_tag_key   = "env"
selection_tag_value = "prod"

# IAM role: create by default (or set create_iam_role=false and provide iam_role_arn)
create_iam_role = true
iam_role_name   = "AWSBackupDefaultServiceRole"
iam_role_arn    = null

# Common tags
tags = {
  project     = "zalak"
  environment = "dev"
  module      = "backup"
}