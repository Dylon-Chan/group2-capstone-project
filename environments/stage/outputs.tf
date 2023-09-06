# Output the DNS name of the Application Load Balancer (ALB)
output "alb_hostname" {
  value = aws_lb.loadbalancer.dns_name
}

# Output the Amazon Resource Name (ARN) of the Target Group associated with the Load Balancer
output "target_group_arn" {
  value = aws_lb_target_group.load_balancer_tg.arn
}