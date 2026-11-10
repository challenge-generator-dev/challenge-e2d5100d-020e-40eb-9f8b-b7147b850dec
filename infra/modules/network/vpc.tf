# Módulo para la creación de la VPC y subredes necesarias para el servicio de órdenes
# Superficie de práctica - El estudiante debe implementar la lógica completa

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Recurso: aws_vpc
# Atributos requeridos: cidr_block, enable_dns_hostnames, enable_dns_support
# Tags obligatorios: Environment, Project, ManagedBy
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    ManagedBy   = "Terraform"
  }
}

# Recurso: aws_subnet (múltiples - una por AZ)
# Atributos requeridos: vpc_id, cidr_block, availability_zone, map_public_ip_on_launch
# Debe haber al menos 2 subredes públicas en diferentes AZs
resource "aws_subnet" "public" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    ManagedBy   = "Terraform"
    Type        = "public"
  }
}

# Recurso: aws_internet_gateway
# Atributos requeridos: vpc_id
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    ManagedBy   = "Terraform"
  }
}

# Recurso: aws_route_table
# Atributos requeridos: vpc_id, route (hacia internet)
# Recurso: aws_route_table_association (asociar subredes a la tabla de rutas)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    ManagedBy   = "Terraform"
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public[*].id)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Recurso: aws_subnet (privadas)
resource "aws_subnet" "private" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = {
    Environment = var.environment
    Project     = "orders-service"
    ManagedBy   = "Terraform"
    Type        = "private"
  }
}