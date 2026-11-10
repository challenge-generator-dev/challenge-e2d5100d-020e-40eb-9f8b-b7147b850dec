# Outputs del módulo de base de datos para exponer ARN de la tabla DynamoDB
# Este archivo es superficie de práctica - el estudiante debe completar los outputs

output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.arn # TODO(reto): completar referencia
}

output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.name # TODO(reto): completar referencia
}