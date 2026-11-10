# Outputs del módulo de cómputo para exponer DNS del load balancer y ARN del cluster ECS
# Este archivo es superficie de práctica - el estudiante debe completar los outputs

output "ecs_cluster_arn" {
  description = "ARN del cluster ECS"
  value       = aws_ecs_cluster.this.arn # TODO(reto): completar referencia
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  value       = aws_ecs_cluster.this.name # TODO(reto): completar referencia
}

output "load_balancer_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = aws_lb.this.dns_name # TODO(reto): completar referencia
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.this.arn # TODO(reto): completar referencia
}

output "target_group_arn" {
  description = "ARN del target group"
  value       = aws_lb_target_group.this.arn # TODO(reto): completar referencia
}