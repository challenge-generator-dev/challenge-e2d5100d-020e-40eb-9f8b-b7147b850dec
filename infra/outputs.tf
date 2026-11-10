output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

output "ecs_cluster_arn" {
  description = "ARN del cluster ECS"
  value       = module.ecs.ecs_cluster_arn
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  value       = module.ecs.ecs_cluster_name
}

output "load_balancer_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = module.load_balancer.load_balancer_dns_name
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.load_balancer.load_balancer_arn
}

output "target_group_arn" {
  description = "ARN del target group del ALB"
  value       = module.load_balancer.target_group_arn
}

output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = module.dynamodb.dynamodb_table_name
}

output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = module.dynamodb.dynamodb_table_arn
}

output "sns_topic_arn" {
  description = "ARN del topic SNS para alarmas"
  value       = module.monitoring.sns_topic_arn
}

output "dashboard_name" {
  description = "Nombre del dashboard de CloudWatch"
  value       = module.monitoring.dashboard_name
}

output "environment" {
  description = "Entorno de despliegue"
  value       = var.environment
  sensitive   = false
}

output "aws_region" {
  description = "Región de AWS"
  value       = var.aws_region
  sensitive   = false
}