# Variables para parametrizar la configuración de los recursos AWS del servicio de órdenes.
# Estas variables permiten personalizar el despliegue sin modificar el código principal.

# Ejemplo de variable para la región AWS donde se desplegarán los recursos.
# variable "aws_region" {
#   description = "Región AWS donde se crearán los recursos."
#   type        = string
#   default     = "us-east-1"
# }

# Ejemplo de variable para el entorno (dev, staging, prod).
# variable "environment" {
#   description = "Entorno de despliegue (dev, staging, prod)."
#   type        = string
#   default     = "dev"
# }

# Ejemplo de variable para el CIDR block de la VPC.
# variable "vpc_cidr" {
#   description = "CIDR block para la VPC."
#   type        = string
#   default     = "10.0.0.0/16"
# }

# Ejemplo de variable para el nombre del servicio.
# variable "service_name" {
#   description = "Nombre del servicio de órdenes."
#   type        = string
#   default     = "order-service"
# }