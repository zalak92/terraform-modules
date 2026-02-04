# AWS context
variable "aws_profile" {
  type = string
}
variable "region" {
  type = string
}

# Inputs mirroring the module
variable "name" {
  type = string
}
variable "ami_id" {
  type    = string
  default = ""
}
variable "architecture" {
  type    = string
  default = "arm64"
}
variable "instance_type" {
  type    = string
  default = "t4g.nano"
}
variable "subnet_id" {
  type = string
}
variable "sg_ids" {
  type    = list(string)
  default = []
}
variable "key_name" {
  type    = string
  default = ""
}
variable "iam_instance_profile" {
  type    = string
  default = ""
}
variable "associate_public_ip" {
  type    = bool
  default = true
}
variable "volume_size" {
  type    = number
  default = 8
}
variable "user_data" {
  type    = string
  default = ""
}
variable "tags" {
  type    = map(string)
  default = {}
}