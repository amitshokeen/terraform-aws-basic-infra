variable "ec2_instance_type" {
  type        = string
  description = "stick to the free tier please"
}

variable "ec2_instance_name" {
  type = string
}

variable "number_of_instances" {
  type = number
}

variable "ec2_ami_id" {
  type = string
}

