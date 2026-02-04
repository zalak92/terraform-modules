module "compute" {
  source = "../../../modules/ec2"

  name                 = var.name
  ami_id               = var.ami_id
  architecture         = var.architecture
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id
  sg_ids               = var.sg_ids
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile
  associate_public_ip  = var.associate_public_ip
  volume_size          = var.volume_size
  user_data            = var.user_data
  tags                 = var.tags
}