vpc_cidr_block     = "10.0.0.0/16"
vpc_name_tag       = "project VPC"
public_cidr_block  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_cidr_block = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
igw_name           = "project igw"
route_table_name   = "project public route table"
ip_address         = "109.148.221.139/32"
instance_type      = "t2.micro"
project_key        = "projectkey"
desired_capacity   = "3"
max_size           = "3"
min_size           = "3"
