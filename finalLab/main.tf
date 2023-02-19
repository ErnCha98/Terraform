module "network"{
source ="./network"

##in-filename = local.cidr_block malo
cidr_block = var.cidr_block
public_cidr_block_a = var.public_cidr_block_a
public_cidr_block_b = var.public_cidr_block_b
private_cidr_block = var.private_cidr_block
public_zone_a= var.public_zone_a
public_zone_b = var.public_zone_b
private_zone = var.private_zone
lab_name = var.lab_name

}

module "securityGroup"{
    source = "./securityGroups"
    vpc = module.network.vpc
}

module "bastion" {
    source = "./ec2"
    lab_name = var.lab_name
    aws_key = aws_key_pair.ec2_key
    private_key = tls_private_key.privateKey.private_key_pem
    aws_ami = data.aws_ami.ubuntu
    public_subnet_a = module.network.public_subnet_a
    sgPublic = module.securityGroup.sgPublic
}

module "loadbalancer"{
    source = "./loadBalancer"

    vpc = module.network.vpc
    lab_name = var.lab_name
    public_subnet_a = module.network.public_subnet_a
    public_subnet_b = module.network.public_subnet_b
    sgPublic = module.securityGroup.sgPublic

}

module "autoscalingGroup"{

    source ="./autoscalingGroup"

    lab_name = var.lab_name
    ubuntu_ami = data.aws_ami.ubuntu
    ssh_key = aws_key_pair.ec2_key
    sgPrivate = module.securityGroup.sgPrivate
    private_subnet = module.network.private_subnet
    tgWebserver_arn = module.loadbalancer.tgWebserver_arn

}

module "dns" {

    source ="./dns"
    albWebserver = module.loadbalancer.albWebserver
}

