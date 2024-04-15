module "my_ec2_instance" {
  source = "./modules/ec2-instance"
  ec2_instance_type   = var.ec2_instance_type
  ec2_instance_name   = var.ec2_instance_name
  number_of_instances = var.number_of_instances
  ec2_ami_id          = var.ec2_ami_id
}