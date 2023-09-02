#Output the ALB Hostname

output "alb_hostname" {
  value = aws_lb.loadbalancer.dns_name
}