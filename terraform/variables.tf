variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_az1" {
  type = string
}

variable "public_subnet_az2" {
  type = string
}

variable "private_subnet_az1" {
  type = string
}

variable "private_subnet_az2" {
  type = string
}


variable "ami_id" {

  description = "Amazon Linux 2023 AMI"

  type = string

}