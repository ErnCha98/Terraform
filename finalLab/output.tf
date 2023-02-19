output "bastion_host"{
    value = "ssh -i key.pem ubuntu@${module.bastion.bastion_public_ip}"
}