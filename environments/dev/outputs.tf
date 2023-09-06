#Output the IP address of the ECS cluster service

# Fetch all network interfaces that are associated with a specific security group
data "aws_network_interfaces" "all" {
  filter {
    name = "group-id"
    values = [aws_security_group.ecs_sg.id]
  }
}

# For each network interface ID fetched from the above data source, get detailed information about the individual network interface
data "aws_network_interface" "all" {
  for_each = toset(data.aws_network_interfaces.all.ids)
    id = each.key
}

# Output URLs for accessing all the network interfaces.
# This constructs a HTTP URL using the public IP of each network interface and a given port.
output "all_access_urls" {
  value = {
    for k, v in data.aws_network_interface.all : k => "http://${v.association[0].public_ip}:${var.image_port}"
  }
}

output "ecs_name" {
  value = aws_ecs_cluster.cluster.name
}