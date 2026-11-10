locals {
  common_tags = {
    Environment = var.environment
    Project     = "orders-service"
    ManagedBy   = "terraform"
    CostCenter  = "engineering"
  }

  vpc_cidr            = var.environment == "production" ? "10.0.0.0/16" : (var.environment == "staging" ? "10.1.0.0/16" : "10.2.0.0/16")
  availability_zones  = ["${var.aws_region}a", "${var.aws_region}b"]
  cluster_name        = "orders-${var.environment}"
  lb_name             = "orders-alb-${var.environment}"
  dynamodb_table_name = "orders-${var.environment}"
  service_name        = "orders-service"
}

module "network" {
  source = "./modules/network"

  vpc_cidr           = local.vpc_cidr
  availability_zones = local.availability_zones
  environment        = var.environment
}

module "ecs" {
  source = "./modules/compute"

  cluster_name       = local.cluster_name
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.network.security_group_id]
  environment        = var.environment
  container_image    = var.container_image
  container_port     = var.container_port
  desired_count      = var.environment == "production" ? 3 : 1
  lb_name            = local.lb_name
  target_group_port  = var.container_port
  health_check_path  = "/api/orders/health"
  certificate_arn    = var.environment == "production" ? var.acm_certificate_arn : ""
}

module "dynamodb" {
  source = "./modules/database"

  table_name     = local.dynamodb_table_name
  billing_mode   = var.environment == "production" ? "PAY_PER_REQUEST" : "PROVISIONED"
  read_capacity  = var.environment == "production" ? 5 : 2
  write_capacity = var.environment == "production" ? 5 : 2
  hash_key       = "orderId"
  hash_key_type  = "S"
  range_key      = "createdAt"
  range_key_type = "S"
  ttl_attribute  = "expiresAt"
  enable_stream  = true
}

module "monitoring" {
  source = "./modules/monitoring"

  service_name                       = local.service_name
  environment                        = var.environment
  alarm_email                        = var.alarm_email
  lb_target_group_arn                = module.ecs.target_group_arn
  ecs_cluster_name                   = local.cluster_name
  ecs_service_name                   = local.service_name
  dynamodb_table_name                = local.dynamodb_table_name
  dynamo_read_throttle_threshold     = 10
  dynamo_write_throttle_threshold    = 10
  alb_target_response_time_threshold = 2
  ecs_cpu_threshold                  = 80
  ecs_memory_threshold               = 80
}

variable "environment" {
  description = "Entorno de despliegue (production, staging, development)"
  type        = string
  default     = "development"
}

variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "container_image" {
  description = "Imagen del contenedor Docker para el servicio de órdenes"
  type        = string
  default     = "orders-service:latest"
}

variable "container_port" {
  description = "Puerto donde escucha el contenedor"
  type        = number
  default     = 8080
}

variable "alarm_email" {
  description = "Email para recibir notificaciones de alarms"
  type        = string
  default     = "devops@empresa.com"
}

variable "acm_certificate_arn" {
  description = "ARN del certificado ACM para HTTPS en producción"
  type        = string
  default     = ""
}