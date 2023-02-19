resource "aws_instance" "demo-import" {
ami                                  = "ami-033b95fb8079dc481"
associate_public_ip_address          = true
availability_zone                    = "us-east-1d"
instance_type                        = "t3a.nano"
subnet_id                            = "subnet-0c35085d880b88b78"
}