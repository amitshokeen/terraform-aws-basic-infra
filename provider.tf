terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "sydney"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}