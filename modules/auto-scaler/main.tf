

resource "aws_launch_template" "as_instance" {

  instance_type               = var.instance_type
  image_id                        = var.latest_ubuntu
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.project_key
  user_data               = base64encode(<<-EOF
    #!/bin/bash
    apt update
    apt install -y nginx
    echo "Terraform Provisioned Me" > /var/www/html/index.html
    service nginx start
    EOF
  )
}

resource "aws_autoscaling_group" "auto-scaling-group" {
  vpc_zone_identifier = var.public_subnet_ids
  target_group_arns   = [var.target_group]
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  launch_template {
    id = aws_launch_template.as_instance.id
  }
}