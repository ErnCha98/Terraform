resource "aws_instance" "ec2Bastion" {
  instance_type = "t3.nano"
  ami = var.aws_ami.id
  subnet_id = var.public_subnet_a.id
 
  vpc_security_group_ids = [var.sgPublic.id]
  associate_public_ip_address = true
  key_name = var.aws_key.key_name

  tags ={
    Name = "Bastion -${var.lab_name}"
  }

   connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = var.private_key
   }

   provisioner "file" {
    source = "./key.pem"
    destination = "/home/ubuntu/.ssh/id_rsa"

   }

}