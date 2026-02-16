module "backup" {
  source = "../../../modules/backup"

  # Vault
  vault_name       = var.vault_name
  vault_kms_key_arn = var.vault_kms_key_arn

  # Plan & rule
  plan_name                    = var.plan_name
  rule_name                    = var.rule_name
  schedule_cron                = var.schedule_cron
  start_window_minutes         = var.start_window_minutes
  completion_window_minutes    = var.completion_window_minutes
  enable_continuous_backup     = var.enable_continuous_backup

  # Lifecycle
  lifecycle_cold_after_days    = var.lifecycle_cold_after_days
  lifecycle_delete_after_days  = var.lifecycle_delete_after_days

  # Optional copy
  copy_to_vault_arns  = var.copy_to_vault_arns
  copy_cold_after_days = var.copy_cold_after_days
  copy_delete_after_days = var.copy_delete_after_days

  # Selection by tag (env=prod)
  selection_name      = var.selection_name
  selection_tag_type  = var.selection_tag_type
  selection_tag_key   = var.selection_tag_key
  selection_tag_value = var.selection_tag_value

  # IAM role (default: create)
  create_iam_role = var.create_iam_role
  iam_role_name   = var.iam_role_name
  iam_role_arn    = var.iam_role_arn

  # Tags
  tags = var.tags
}