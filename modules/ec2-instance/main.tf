resource "aws_instance" "sample" {
  instance_type = var.ec2_instance_type
  ami           = var.ec2_ami_id
  count         = var.number_of_instances
  tags = {
    Name = var.ec2_instance_name
  }
}