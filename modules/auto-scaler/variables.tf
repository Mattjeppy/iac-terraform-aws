variable "instance_type" {
  type        = string
  description = "type of instance"
}
variable "latest_ubuntu" {
  type        = string
  description = "latest version of ubuntu"
}
variable "security_group_id" {
  type        = string
  description = "security group id"
}
variable "project_key" {
  type        = string
  description = "keypair for ec2 access"
}
variable "availability_zones" {
  type        = list(string)
  description = "availability zones"
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "subnet ids"
}
variable "target_group" {
  type        = string
  description = "target group"
}
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