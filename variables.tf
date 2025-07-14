variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-002e81a9a522f1f19"
}

variable "key_name" {
  default = "deployer-key"
}
