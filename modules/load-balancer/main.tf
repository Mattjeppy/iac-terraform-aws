resource "aws_lb" "project_alb" {
  name               = "project-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups   = [var.security_group_id]
  tags = {
    Name = "Project Load Balancer"
  }
}

resource "aws_lb_target_group" "http_target_group" {
  name     = "http-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "attach_ec2s" {
    count = length(var.instances_id)
  target_group_arn = aws_lb_target_group.http_target_group.arn
  target_id        = var.instances_id[count.index]
  port             = 80
}

resource "aws_lb_listener" "http_listener" {
    load_balancer_arn = aws_lb.project_alb.arn
  port          = 80
  protocol      = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.http_target_group.arn
    type             = "forward"
  }
}
