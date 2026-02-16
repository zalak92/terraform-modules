output "backup_vault_arn" {
  value = aws_backup_vault.vault.arn
}

output "backup_plan_id" {
  value = aws_backup_plan.plan.id
}

output "backup_selection_id" {
  value = aws_backup_selection.selection.id
}

output "backup_iam_role_arn" {
  value = coalesce(var.iam_role_arn, try(aws_iam_role.backup_role[0].arn, null))
}