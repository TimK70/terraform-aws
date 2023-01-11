#--- loadbalancing/main.tf

resource "aws_lb" "two_tier_lb" {
  name            = "two-tier-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}

resource "aws_lb_target_group" "two_tier_tg" {
  name = "two-tier-tg-${substr(uuid(), 0, 3)}"
  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
  port     = var.tg_port     #80
  protocol = var.tg_protocol # "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    healthy_threshold   = var.lb_healthy_threshold   #2
    unhealthy_threshold = var.lb_unhealthy_threshold #2
    timeout             = var.lb_timeout             #3
    interval            = var.lb_interval            #30
  }
}

resource "aws_lb_listener" "two_tier_lb_listener" {
  load_balancer_arn = aws_lb.two_tier_lb.arn
  port              = var.listener_port     #80
  protocol          = var.listener_protocol #"HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.two_tier_tg.arn
  }

}