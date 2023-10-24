provider "aws" {
    region=var.region
    profile=var.profile
}

resource "aws_security_group" "allow_all_tcp" {
  name        = "allow_all_tcp_and_ssh"
  description = "Allow all TCP inbound and outbound and SSH from all IPs"

  # Ingress rule to allow SSH from all IPs
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule to allow all TCP traffic
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all TCP outbound traffic
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "site" {
    ami = "ami-042e8287309f5df03"
    instance_type="t2.micro"
    key_name="devops01"
    vpc_security_group_ids = ["sg-0952c3809647f9c0f",aws_security_group.allow_all_tcp.id]
        tags = {
            Name = var.name
            group = var.group
        }
}