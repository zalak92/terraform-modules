variable "name" {
    }
variable "password" {
  sensitive = true
}
variable "size" {
  default = "Small"
}
variable "directory_type" {
  default = "SimpleAD"   # SimpleAD or MicrosoftAD
}
variable "edition" {
  default = "Standard"
}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}