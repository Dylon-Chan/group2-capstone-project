#Output the ALB Hostname, Target Group ARN and Route53 Record Name

output "alb_hostname" {
  value = aws_lb.loadbalancer.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.load_balancer_tg.arn
}

output "route53_record_name" {
  value = aws_route53_record.www.name
}