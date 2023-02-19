resource "aws_security_group" "sgPrivate" {
  name        = "sgPrivate"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_multiports"
  }
}

resource "aws_security_group_rule" "private_http"{
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    source_security_group_id = aws_security_group.sgPublic.id
    security_group_id= aws_security_group.sgPrivate.id
}

resource "aws_security_group_rule" "private_ssh"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = aws_security_group.sgPublic.id
    security_group_id= aws_security_group.sgPrivate.id
}