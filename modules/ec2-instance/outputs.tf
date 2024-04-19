output "ec2_instance_id" {
  value = aws_instance.sample[*].id
}

output "ec2_instance_public_ipv4" {
  value = aws_instance.sample[*].public_ip
}