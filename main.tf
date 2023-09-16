locals {
  ubuntu_ami = data.aws_ami.latest_ubuntu.id
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  vpc_name_tag       = var.vpc_name_tag
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  availability_zones = var.availability_zones
  igw_name           = var.igw_name
  route_table_name   = var.route_table_name
}
module "security-group" {
  source     = "./modules/security-groups"
  vpc_id     = module.vpc.vpc_id
  ip_address = var.ip_address
}

module "ec2" {
  source            = "./modules/ec2"
  public_subnet_ids = module.vpc.subnet_id
  instance_type     = var.instance_type
  security_group_id = module.security-group.sg_id
  project_key       = var.project_key
  latest_ubuntu     = local.ubuntu_ami
}

module "load-balancer" {
  source            = "./modules/load-balancer"
  public_subnet_ids = module.vpc.subnet_id
  security_group_id = module.security-group.sg_id
  vpc_id            = module.vpc.vpc_id
  instances_id      = module.ec2.instances_id
}

module "auto-scaler" {
  source             = "./modules/auto-scaler"
  instance_type      = var.instance_type
  latest_ubuntu      = local.ubuntu_ami
  security_group_id  = module.security-group.sg_id
  project_key        = var.project_key
  availability_zones = var.availability_zones
  public_subnet_ids  = module.vpc.subnet_id
  target_group       = module.load-balancer.target_group
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

}