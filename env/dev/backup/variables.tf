variable "region" {

}
variable "aws_profile" {

}

# Vault
variable "vault_name" {

}
variable "vault_kms_key_arn" {
  default = null
}

# Plan & rule
variable "plan_name" {

}
variable "rule_name" {

}
variable "schedule_cron" {

}
variable "start_window_minutes" {

}
variable "completion_window_minutes" {

}
variable "enable_continuous_backup" {

}

# Lifecycle
variable "lifecycle_cold_after_days" {

}
variable "lifecycle_delete_after_days" {

}

# Optional copy
variable "copy_to_vault_arns" {
  type    = list(string)
  default = []
}
variable "copy_cold_after_days" {

}
variable "copy_delete_after_days" {

}

# Selection (tags)
variable "selection_name" {

}
variable "selection_tag_type" {

}
variable "selection_tag_key" {

}
variable "selection_tag_value" {

}

# IAM role
variable "create_iam_role" {

}
variable "iam_role_name" {
    
}
variable "iam_role_arn" {
  default = null
}

# Common tags
variable "tags" {
  type    = map(string)
  default = {}
}