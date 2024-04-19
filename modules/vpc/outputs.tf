output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.PublicSubnet.id
}

output "vpc_sg_id" {
  value       = aws_security_group.allow_ssh_http.id
  description = "Security Group ID"
}