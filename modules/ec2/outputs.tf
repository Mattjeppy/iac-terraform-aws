output "instances_id" {
    value = aws_instance.ec2_instances[*].id
}