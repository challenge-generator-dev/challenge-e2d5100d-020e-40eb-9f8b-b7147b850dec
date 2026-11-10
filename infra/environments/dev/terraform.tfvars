# Valores de variables para el ambiente de desarrollo
# Estas variables parametrizan la infraestructura del servicio de órdenes

# Configuración regional de AWS
region = "us-east-1"

# Nombre del entorno
environment = "dev"

# Configuración de la VPC
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]

# Configuración de subredes
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.10.0/24", "10.0.20.0/24"]
database_subnet_cidrs = ["10.0.100.0/24", "10.0.110.0/24"]

# Configuración de ECS
cluster_name             = "orders-service-cluster-dev"
cluster_instance_type    = "t3.medium"
cluster_desired_capacity = 2
cluster_max_size         = 4
cluster_min_size         = 1

# Configuración del servicio de órdenes
service_name          = "orders-service"
service_image         = "orders-service:latest"
service_port          = 8080
service_desired_count = 2
service_cpu           = 256
service_memory        = 512

# Configuración de base de datos DynamoDB
dynamodb_table_name     = "orders-dev"
dynamodb_read_capacity  = 5
dynamodb_write_capacity = 5

# Configuración de balanceador de carga
lb_name                       = "orders-lb-dev"
lb_type                       = "application"
lb_internal                   = false
lb_enable_deletion_protection = false

# Configuración de CloudWatch
enable_monitoring  = true
log_retention_days = 7

# Tags comunes para todos los recursos
common_tags = {
  Environment = "dev"
  Project     = "orders-service"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
}