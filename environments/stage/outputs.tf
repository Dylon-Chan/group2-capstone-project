#Output the ALB Hostname and Target Group ARN

output "alb_hostname" {
  value = aws_lb.loadbalancer.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.load_balancer_tg.arn
}