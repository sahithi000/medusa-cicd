# Optionally print the cluster or service name
output "cluster_name" {
  value = aws_ecs_cluster.medusa_cluster.name
}

output "service_name" {
  value = aws_ecs_service.medusa_service.name
}

