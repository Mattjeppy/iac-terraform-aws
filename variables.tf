
#VPC cidr block settings
variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for vpc"
  default     = "10.0.0.0/16"
}
variable "vpc_name_tag" {
  type        = string
  description = "name of vpc"
  default     = "main VPC"
}
# subnet cidr blocks
variable "public_cidr_block" {
  type        = list(string)
  description = "cidr block for subnet"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}
# subnet cidr blocks
variable "private_cidr_block" {
  type        = list(string)
  description = "cidr block for subnet"
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}
#availability zones
variable "availability_zones" {
  type        = list(string)
  description = "availability zones"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
#igw
variable "igw_name" {
  type        = string
  description = "name of internet gateway"
  default     = "main igw"
}
#route table
variable "route_table_name" {
  type        = string
  description = "name of internet gateway"
  default     = "main public route table"
}
#ip_address
variable "ip_address" {
  type        = string
  description = "ip address"
}
#instance settings
variable "instance_type" {
  type        = string
  description = "type of instance"
  default     = "t2.micro"
}
variable "project_key" {
  type        = string
  description = "keypair for ec2 access"
}
#auto-scaler
variable "desired_capacity" {
  type        = string
  description = "desired quantity of instances"
}
variable "max_size" {
  type        = string
  description = "maximum quantity of instances"
}
variable "min_size" {
  type        = string
  description = "minimum quantity of instances"
}