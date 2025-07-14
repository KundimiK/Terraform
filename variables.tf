variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-001e387a55c961ff2"
}

variable "key_name" {
  default = "deployer-key"
}
