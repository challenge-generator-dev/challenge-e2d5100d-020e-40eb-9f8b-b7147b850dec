# Módulo para la creación de security groups que controlan el tráfico hacia los recursos
# Superficie de práctica - El estudiante debe implementar la lógica completa

variable "vpc_id" {
  description = "ID de la VPC donde se crearán los security groups"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

# TODO(reto): Implementar Security Group para el Application Load Balancer
# Recurso: aws_security_group
# Nombre: sg-alb-{environment}
# Descripción: Security group para el ALB que permite tráfico HTTP/HTTPS desde internet
# Reglas de entrada:
#   - HTTP (80) desde 0.0.0.0/0
#   - HTTPS (443) desde 0.0.0.0/0
# Reglas de salida: todo el tráfico permitido
resource "aws_security_group" "alb" {
  name        = "sg-alb-${var.environment}"
  description = "Security group para el ALB que permite tráfico HTTP/HTTPS desde internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP desde internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS desde internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Todo el tráfico saliente"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    Name        = "sg-alb-${var.environment}"
  }
}

# TODO(reto): Implementar Security Group para el servicio ECS
# Recurso: aws_security_group
# Nombre: sg-ecs-{environment}
# Descripción: Security group para los contenedores ECS
# Reglas de entrada:
#   - Tráfico desde el SG del ALB (puerto de la aplicación)
#   - Tráfico desde la misma VPC (para debugging/monitoring)
# Reglas de salida:
#   - Tráfico hacia internet (para dependencias externas)
#   - Tráfico hacia AWS services (S3, DynamoDB, etc.)
resource "aws_security_group" "ecs" {
  name        = "sg-ecs-${var.environment}"
  description = "Security group para los contenedores ECS"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Tráfico desde el ALB"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description = "Tráfico desde la VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "Tráfico hacia internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    Name        = "sg-ecs-${var.environment}"
  }
}

# TODO(reto): Implementar Security Group para RDS (si aplica)
# Recurso: aws_security_group
# Nombre: sg-rds-{environment}
# Descripción: Security group para la base de datos
# Reglas de entrada:
#   - Tráfico desde el SG de ECS hacia el puerto de PostgreSQL (5432)
resource "aws_security_group" "rds" {
  name        = "sg-rds-${var.environment}"
  description = "Security group para la base de datos RDS"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Tráfico desde ECS hacia PostgreSQL"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs.id]
  }

  egress {
    description = "Tráfico saliente"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    Name        = "sg-rds-${var.environment}"
  }
}

# Output: ID del security group del ALB
output "alb_security_group_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb.id
}

# Output: ID del security group de ECS
output "ecs_security_group_id" {
  description = "ID del security group de ECS"
  value       = aws_security_group.ecs.id
}