# Vault
variable "vault_name" {
  type = string
}
variable "vault_kms_key_arn" {
  type    = string
  default = null
}

# Plan & Rule
variable "plan_name" {
  type = string
}
variable "rule_name" {
  type = string
}
variable "schedule_cron" {
  type    = string
  # Example: Daily 02:00 UTC — adjust as needed
  default = "cron(0 2 * * ? *)"
}
variable "start_window_minutes" {
  type    = number
  default = 60
}
variable "completion_window_minutes" {
  type    = number
  default = 180
}
variable "enable_continuous_backup" {
  type    = bool
  default = false
}

# Lifecycle
variable "lifecycle_cold_after_days" {
  type    = number
  default = 0
}
variable "lifecycle_delete_after_days" {
  type    = number
  default = 30
}

# Optional cross‑Region/Account copy
variable "copy_to_vault_arns" {
  type    = list(string)
  default = []
}
variable "copy_cold_after_days" {
  type    = number
  default = 0
}
variable "copy_delete_after_days" {
  type    = number
  default = 30
}

# Selection (tag-based)
variable "selection_name" {
  type    = string
  default = "tag-selection"
}
variable "selection_tag_type" {
  type    = string
  default = "STRINGEQUALS"
}
variable "selection_tag_key" {
  type    = string
  default = "env"
}
variable "selection_tag_value" {
  type    = string
  default = "prod"
}

# IAM role for selection
variable "create_iam_role" {
  type    = bool
  default = true
}
variable "iam_role_name" {
  type    = string
  default = "AWSBackupDefaultServiceRole"
}
variable "iam_role_arn" {
  type    = string
  default = null
}

# Common tags
variable "tags" {
  type    = map(string)
  default = {}
}