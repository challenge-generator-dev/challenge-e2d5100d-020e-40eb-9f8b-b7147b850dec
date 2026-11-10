# Outputs del módulo de red para exponer IDs de VPC y subredes
# Este archivo es superficie de práctica - el estudiante debe completar los outputs

output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.this.id # TODO(reto): completar referencia
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id # TODO(reto): completar referencia
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id # TODO(reto): completar referencia
}

output "security_group_id" {
  description = "ID del security group"
  value       = aws_security_group.this.id # TODO(reto): completar referencia
}