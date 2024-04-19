module "my_vpc" {
  source = "./modules/vpc"
}

module "my_ec2_instance" {
  source              = "./modules/ec2-instance"
  ec2_instance_type   = var.ec2_instance_type
  ec2_instance_name   = var.ec2_instance_name
  number_of_instances = var.number_of_instances
  ec2_ami_id          = var.ec2_ami_id
  environment         = var.environment
  key_name            = var.key_name
}

output "ec2_instance_id" {
  value = module.my_ec2_instance.ec2_instance_id
}

output "ec2_public_ipv4_address" {
  value = module.my_ec2_instance.ec2_instance_public_ipv4
}

output "vpc_id" {
  value = module.my_vpc.vpc_id
}

output "public_subnet_id" {
  value = module.my_vpc.public_subnet_id
}

output "vpc_sg_id" {
  value = module.my_vpc.vpc_sg_id
}