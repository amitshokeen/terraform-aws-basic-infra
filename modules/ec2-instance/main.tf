module "vpc" {
  source = "../vpc"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "sydney"
}

resource "aws_instance" "sample" {
  provider                    = aws.sydney
  instance_type               = var.ec2_instance_type
  ami                         = var.ec2_ami_id
  count                       = var.number_of_instances
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.vpc.vpc_sg_id]
  subnet_id                   = module.vpc.public_subnet_id
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}