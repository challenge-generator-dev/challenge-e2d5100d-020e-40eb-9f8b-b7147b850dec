# Módulo para la creación de la tabla DynamoDB para persistir las órdenes
# Superficie de práctica: completar la configuración de la tabla DynamoDB

variable "table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "billing_mode" {
  description = "Modo de facturación de la tabla"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "Capacidad de lectura para modo aprovisionado"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Capacidad de escritura para modo aprovisionado"
  type        = number
  default     = 5
}

variable "hash_key" {
  description = "Nombre de la clave de partición"
  type        = string
  default     = "orderId"
}

variable "hash_key_type" {
  description = "Tipo de dato de la clave de partición"
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "Nombre de la clave de ordenación"
  type        = string
  default     = "createdAt"
}

variable "range_key_type" {
  description = "Tipo de dato de la clave de ordenación"
  type        = string
  default     = "S"
}

variable "ttl_attribute" {
  description = "Nombre del atributo TTL para eliminación automática"
  type        = string
  default     = "ttl"
}

variable "enable_stream" {
  description = "Habilitar streams de DynamoDB para captura de cambios"
  type        = bool
  default     = true
}

locals {
  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
    Project     = "order-service"
  }
}

resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  range_key    = var.range_key

  dynamic "attribute" {
    for_each = [
      { name = var.hash_key, type = var.hash_key_type },
      { name = var.range_key, type = var.range_key_type }
    ]
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "provisioned_throughput" {
    for_each = var.billing_mode == "PROVISIONED" ? [1] : []
    content {
      read_capacity  = var.read_capacity
      write_capacity = var.write_capacity
    }
  }

  ttl {
    attribute_name = var.ttl_attribute
    enabled        = true
  }

  stream_specification {
    stream_enabled   = var.enable_stream
    stream_view_type = "NEW_AND_OLD_IMAGES"
  }

  tags = local.tags
}

resource "aws_dynamodb_table" "gsi_status" {
  name         = "${var.table_name}-by-status"
  billing_mode = var.billing_mode
  hash_key     = "status"
  range_key    = var.range_key

  attribute {
    name = "status"
    type = "S"
  }

  attribute {
    name = var.range_key
    type = var.range_key_type
  }

  dynamic "provisioned_throughput" {
    for_each = var.billing_mode == "PROVISIONED" ? [1] : []
    content {
      read_capacity  = var.read_capacity
      write_capacity = var.write_capacity
    }
  }

  tags = local.tags
}

output "table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.arn
}

output "table_stream_arn" {
  description = "ARN del stream de la tabla"
  value       = var.enable_stream ? aws_dynamodb_table.this.stream_arn : null
}