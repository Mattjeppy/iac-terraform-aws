
variable "vpc_cidr_block" {
    type = string
    description = "cidr block for vpc"
}
variable "vpc_name_tag" {
    type = string
    description = "name of vpc"
}
variable "public_cidr_block" {
    type = list(string)
    description = "cidr block for subnet"
}
variable "private_cidr_block" {
    type = list(string)
    description = "cidr block for subnet"
}
variable "availability_zones" {
    type = list(string)
    description = "availability zones"
}

variable "igw_name" {
    type = string
    description = "name of internet gateway"
}
variable "route_table_name" {
    type = string
    description = "name of internet gateway"
}
variable "project_key" {
  type = string
  description = "keypair for ec2 access"
  default = "projectkey"
}