# Configuración del provider de AWS y backend para el estado de Terraform.
# Este archivo define cómo Terraform interactúa con AWS y dónde almacena el estado.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }

  # Configuración del backend para almacenar el estado de Terraform.
  # El estado se almacena en un bucket S3 para permitir colaboración y versionado.
  backend "s3" {
    bucket         = "terraform-state-bucket-order-service"
    key            = "terraform/state/order-service.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-order-service"
  }
}

# Configuración del provider de AWS.
# Utiliza las credenciales configuradas en el entorno o mediante AWS CLI.
provider "aws" {
  region = "us-east-1"

  # Etiquetado por defecto para todos los recursos creados.
  default_tags {
    tags = {
      Environment = "dev"
      Service     = "order-service"
      Terraform   = "true"
    }
  }
}