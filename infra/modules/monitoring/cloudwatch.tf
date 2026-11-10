# Módulo para la creación de alarmas y dashboards de CloudWatch para monitoreo
# Superficie de práctica: completar la configuración de alarmas y dashboards

variable "service_name" {
  description = "Nombre del servicio para identificar recursos"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "production"
}

variable "alarm_email" {
  description = "Email para notificaciones de alarmas"
  type        = string
}

variable "lb_target_group_arn" {
  description = "ARN del target group del ALB para métricas"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Nombre del cluster ECS para métricas"
  type        = string
}

variable "ecs_service_name" {
  description = "Nombre del servicio ECS para métricas"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB para métricas"
  type        = string
}

variable "dynamo_read_throttle_threshold" {
  description = "Umbral de throttled reads para alarma"
  type        = number
  default     = 10
}

variable "dynamo_write_throttle_threshold" {
  description = "Umbral de throttled writes para alarma"
  type        = number
  default     = 10
}

variable "alb_target_response_time_threshold" {
  description = "Umbral de tiempo de respuesta del ALB en segundos"
  type        = number
  default     = 2
}

variable "ecs_cpu_threshold" {
  description = "Umbral de uso de CPU de ECS en porcentaje"
  type        = number
  default     = 80
}

variable "ecs_memory_threshold" {
  description = "Umbral de uso de memoria de ECS en porcentaje"
  type        = number
  default     = 80
}

locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Service     = var.service_name
  }
}

resource "aws_sns_topic" "alarms" {
  name = "${var.service_name}-alarms"

  tags = local.common_tags
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alarms.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {
  alarm_name          = "${var.service_name}-ecs-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = var.ecs_cpu_threshold
  alarm_description   = "Alarma cuando el uso de CPU de ECS supera el umbral"
  alarm_actions       = [aws_sns_topic.alarms.arn]
  ok_actions          = [aws_sns_topic.alarms.arn]

  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  tags = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "ecs_memory_high" {
  alarm_name          = "${var.service_name}-ecs-memory-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = var.ecs_memory_threshold
  alarm_description   = "Alarma cuando el uso de memoria de ECS supera el umbral"
  alarm_actions       = [aws_sns_topic.alarms.arn]
  ok_actions          = [aws_sns_topic.alarms.arn]

  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  tags = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "dynamodb_read_throttle" {
  alarm_name          = "${var.service_name}-dynamodb-read-throttle"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ThrottledRequests"
  namespace           = "AWS/DynamoDB"
  period              = 300
  statistic           = "Sum"
  threshold           = var.dynamo_read_throttle_threshold
  alarm_description   = "Alarma cuando las peticiones de lectura son throttleadas"
  alarm_actions       = [aws_sns_topic.alarms.arn]
  ok_actions          = [aws_sns_topic.alarms.arn]

  dimensions = {
    TableName = var.dynamodb_table_name
    Operation = "GetItem"
  }

  tags = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "dynamodb_write_throttle" {
  alarm_name          = "${var.service_name}-dynamodb-write-throttle"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ThrottledRequests"
  namespace           = "AWS/DynamoDB"
  period              = 300
  statistic           = "Sum"
  threshold           = var.dynamo_write_throttle_threshold
  alarm_description   = "Alarma cuando las peticiones de escritura son throttleadas"
  alarm_actions       = [aws_sns_topic.alarms.arn]
  ok_actions          = [aws_sns_topic.alarms.arn]

  dimensions = {
    TableName = var.dynamodb_table_name
    Operation = "PutItem"
  }

  tags = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "alb_target_response_time" {
  alarm_name          = "${var.service_name}-alb-response-time-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = 300
  statistic           = "Average"
  threshold           = var.alb_target_response_time_threshold
  alarm_description   = "Alarma cuando el tiempo de respuesta del ALB es alto"
  alarm_actions       = [aws_sns_topic.alarms.arn]
  ok_actions          = [aws_sns_topic.alarms.arn]

  dimensions = {
    LoadBalancer = var.lb_target_group_arn
  }

  tags = local.common_tags
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.service_name}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", var.ecs_cluster_name, "ServiceName", var.ecs_service_name],
            [".", "MemoryUtilization", ".", ".", ".", "."]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "ECS Resources"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/DynamoDB", "ConsumedReadCapacityUnits", "TableName", var.dynamodb_table_name],
            [".", "ConsumedWriteCapacityUnits", ".", "."]
          ]
          period = 300
          stat   = "Sum"
          region = "us-east-1"
          title  = "DynamoDB Capacity"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/ApplicationELB", "TargetResponseTime", "LoadBalancer", var.lb_target_group_arn]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "ALB Response Time"
        }
      }
    ]
  })
}

output "sns_topic_arn" {
  description = "ARN del topic SNS para alarmas"
  value       = aws_sns_topic.alarms.arn
}

output "dashboard_name" {
  description = "Nombre del dashboard de CloudWatch"
  value       = aws_cloudwatch_dashboard.main.dashboard_name
}