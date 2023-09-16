resource "aws_instance" "ec2_instances" {
  count         = length(var.public_subnet_ids)
  ami           = var.latest_ubuntu
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[count.index] 
  key_name      = var.project_key
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  user_data = <<-EOF
  #!/bin/bash
  apt update
  apt install -y nginx
  echo "Terraform Provisioned Me" > /var/www/html/index.html
  service nginx start
  EOF

  tags = {
    Name = "Instance-${count.index + 1}"
  }
}

