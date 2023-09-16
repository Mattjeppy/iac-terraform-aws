variable "public_subnet_ids" {
  type        = list(string)
  description = "public subnet ids"
}
variable "instance_type" {
  type        = string
  description = "type of instance"
}
variable "security_group_id" {
  type        = string
  description = "security group id"
}
variable "project_key" {
  type = string
  description = "keypair for ec2 access"
}
variable "latest_ubuntu" {
  type        = string
  description = "latest version of ubuntu"
}