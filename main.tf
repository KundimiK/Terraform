provider "aws" {
  region = var.aws_region
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = var.instance_type
  ami                    = var.ami_id
  key_name               = var.key_name
  monitoring             = true
  subnet_id     = "subnet-0b26182956477ce9f"
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "this" {
  name        = "demo-ec2-sg"
  description = "Allow SSH & HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
