# Módulo para la creación del cluster ECS y definición de tareas para el servicio de órdenes
# Superficie de práctica - El estudiante debe implementar la lógica completa

variable "cluster_name" {
  description = "Nombre del cluster ECS"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el cluster"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes donde se desplegarán las tareas"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups para las tareas"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "container_image" {
  description = "Imagen del contenedor para el servicio de órdenes"
  type        = string
}

variable "container_port" {
  description = "Puerto del contenedor"
  type        = number
  default     = 8080
}

variable "desired_count" {
  description = "Número deseado de tareas"
  type        = number
  default     = 2
}

# TODO(reto): Implementar el cluster ECS
# Recurso: aws_ecs_cluster
# Nombre: {cluster_name}
# Configuración:
#   - setting: containerInsights = enabled
#   - Tags: Environment, Project
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Environment = var.environment
    Project     = "orders-service"
  }
}

# TODO(reto): Implementar definición de tarea ECS (Task Definition)
# Recurso: aws_ecs_task_definition
# Familia: orders-service
# Tipo de red: awsvpc
# Definición de contenedor:
#   - name: orders-service
#   - image: {container_image}
#   - essential: true
#   - portMappings: containerPort = {container_port}, protocol = tcp
#   - environment: variables de configuración
#   - logConfiguration: awslogs
resource "aws_ecs_task_definition" "this" {
  family                   = "orders-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.execution.arn
  task_role_arn            = aws_iam_role.task.arn

  container_definitions = jsonencode([
    {
      name      = "orders-service"
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]
      environment = [
        { name = "ENVIRONMENT", value = var.environment }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/orders-service"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Environment = var.environment
    Project     = "orders-service"
  }
}

# TODO(reto): Implementar IAM role para ejecución de tareas
resource "aws_iam_role" "execution" {
  name = "${var.cluster_name}-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = "orders-service"
  }
}

resource "aws_iam_role_policy_attachment" "execution" {
  role       = aws_iam_role.execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "task" {
  name = "${var.cluster_name}-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = "orders-service"
  }
}

resource "aws_iam_role_policy" "task_dynamodb" {
  name = "dynamodb-access"
  role = aws_iam_role.task.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]
        Resource = "*"
      }
    ]
  })
}

# Output: ARN del cluster
output "cluster_arn" {
  description = "ARN del cluster ECS"
  value       = aws_ecs_cluster.this.arn
}

# Output: Nombre del cluster
output "cluster_name" {
  description = "Nombre del cluster ECS"
  value       = aws_ecs_cluster.this.name
}

# Output: ARN de la definición de tarea
output "task_definition_arn" {
  description = "ARN de la definición de tarea"
  value       = aws_ecs_task_definition.this.arn
}