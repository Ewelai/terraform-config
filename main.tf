resource "aws_instance" "trucking_terraform" {
  ami           = var.ami
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = "Trucking terraform"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "Trucking Security Group"
  description = "Description"

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

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
