resource "aws_security_group" "sgPublic" {
  name        = "sgPublic"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc.id

  ingress {
    description      = "SSH from internet"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }
   ingress {
    description      = "HTTPS from Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}