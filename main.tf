provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source         = "./modules/aws-vpc"
  vpc_name       = "k8s-vpc"
  vpc_cidr_block = "10.0.0.0/16"
}

module "security_group" {
  source  = "./modules/aws-security-group"
  sg_name = "my-custom-security-group"
  vpc_id  = module.vpc.vpc_id
}

module "instance_1" {
  source               = "./modules/aws-ec2-instance"
  instance_name        = "k8s-instance-1"
  instance_type        = var.instance_type
  ami_id               = var.ami_id
  key_name             = var.key_name
  subnet_id            = module.vpc.private_subnets[0]
  security_group_ids   = [module.security_group.security_group_id]
  ssm_instance_profile = var.ssm_instance_profile
}

module "instance_2" {
  source               = "./modules/aws-ec2-instance"
  instance_name        = "k8s-instance-2"
  instance_type        = var.instance_type
  ami_id               = var.ami_id
  key_name             = var.key_name
  subnet_id            = module.vpc.private_subnets[1]
  security_group_ids   = [module.security_group.security_group_id]
  ssm_instance_profile = var.ssm_instance_profile
}
