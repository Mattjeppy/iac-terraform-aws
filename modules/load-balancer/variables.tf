variable "public_subnet_ids" {
  type        = list(string)
  description = "public subnet ids"
}
variable "security_group_id" {
  type        = string
  description = "security group id"
}
variable "vpc_id" {
    type = string
    description = "vpc id"
}
variable "instances_id" {
    type = list(string)
    description = "instances id"
}