#############################################
# IAM Role for AWS Backup
#############################################
data "aws_caller_identity" "current" {}

locals {
  effective_iam_role_arn = var.create_iam_role ? aws_iam_role.backup_role[0].arn : var.iam_role_arn
}

resource "aws_iam_role" "backup_role" {
  count = var.create_iam_role ? 1 : 0

  name               = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "backup.amazonaws.com" },
      Action   = "sts:AssumeRole"
    }]
  })
}

# Attach AWS managed policies for Backup + Restore
resource "aws_iam_role_policy_attachment" "backup_attach" {
  count      = var.create_iam_role ? 1 : 0
  role       = aws_iam_role.backup_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_iam_role_policy_attachment" "restore_attach" {
  count      = var.create_iam_role ? 1 : 0
  role       = aws_iam_role.backup_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}

#############################################
# Backup Vault
#############################################
resource "aws_backup_vault" "vault" {
  name        = var.vault_name
  kms_key_arn = var.vault_kms_key_arn
  tags        = var.tags
}

#############################################
# Backup Plan (+ Rule)
#############################################
resource "aws_backup_plan" "plan" {
  name = var.plan_name
  tags = var.tags

  rule {
    rule_name              = var.rule_name
    target_vault_name      = aws_backup_vault.vault.name
    schedule               = var.schedule_cron
    start_window           = var.start_window_minutes
    completion_window      = var.completion_window_minutes
    enable_continuous_backup = var.enable_continuous_backup

    lifecycle {
      cold_storage_after = var.lifecycle_cold_after_days
      delete_after       = var.lifecycle_delete_after_days
    }

    dynamic "copy_action" {
      for_each = var.copy_to_vault_arns
      content {
        destination_vault_arn = copy_action.value
        lifecycle {
          cold_storage_after = var.copy_cold_after_days
          delete_after       = var.copy_delete_after_days
        }
      }
    }
  }
}

#############################################
# Selection: tag-based (env=prod by default)
#############################################
resource "aws_backup_selection" "selection" {
  name         = var.selection_name
  iam_role_arn = local.effective_iam_role_arn
  plan_id      = aws_backup_plan.plan.id

selection_tag {
  type  = var.selection_tag_type
  key   = var.selection_tag_key
  value = var.selection_tag_value
}

}