# Infraestructura AWS para el Servicio de Órdenes

Este repositorio contiene la configuración de infraestructura como código utilizando Terraform para desplegar el servicio de órdenes en AWS.

## Estructura del Proyecto

```
infra/
├── environments/
│   └── dev/
│       └── terraform.tfvars    # Variables específicas del entorno dev
├── modules/
│   ├── network/                # Módulo de red: VPC, subnets, security groups
│   ├── compute/                # Módulo de compute: ECS, Load Balancer
│   ├── database/               # Módulo de base de datos: DynamoDB
│   └── monitoring/             # Módulo de monitoreo: CloudWatch
├── main.tf                     # Archivo principal que orquesta los módulos
├── variables.tf                # Definición de variables
├── outputs.tf                  # Outputs del proyecto
├── providers.tf                # Configuración de proveedores
└── versions.tf                 # Versiones de Terraform y proveedores
```

## Requisitos Previos

- Terraform >= 1.9.0
- AWS CLI configurado con credenciales válidas
- Acceso a la cuenta de AWS con permisos necesarios

## Configuración Local

### 1. Inicializar Terraform

```bash
cd infra
terraform init
```

### 2. Validar la Configuración

```bash
terraform validate
```

### 3. Planificar Cambios

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

### 4. Aplicar Cambios

```bash
terraform apply -var-file=environments/dev/terraform.tfvars
```

### 5. Destruir Recursos (Entorno de Desarrollo)

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

## Recursos Desplegados

Este módulo aprovisiona los siguientes recursos AWS:

### Red (Network)
- VPC con CIDR configurable
- Subredes públicas, privadas y de base de datos
- Internet Gateway y NAT Gateways
- Tablas de enrutamiento
- Security Groups para ECS, ALB y acceso a DynamoDB

### Compute
- ECS Cluster para ejecutar el servicio
- ECS Task Definition y Service
- Application Load Balancer con listener y target groups
- Auto Scaling Group para tareas ECS

### Base de Datos
- Tabla DynamoDB para persistencia de órdenes
- Configuración de capacidad read/write

### Monitoreo
- Log Groups en CloudWatch
- Métricas y dashboards de monitoreo

## Outputs Disponibles

- ID de la VPC desplegada
- ARN del ECS Cluster
- DNS del Load Balancer
- Nombre de la tabla DynamoDB
- ARN del Log Group

## Notas de Seguridad

- Los Security Groups están configurados con el principio de mínimo privilegio
- El acceso a la base de datos es únicamente desde subredes privadas
- El balanceador de carga puede configurarse como interno en producción
- Habilitar protección contra eliminación en producción

## Mantenimiento

Para actualizar la infraestructura:
1. Modificar los archivos de configuración necesarios
2. Ejecutar `terraform plan` para ver los cambios
3. Ejecutar `terraform apply` para aplicar los cambios
4. Confirmar que los cambios se aplicaron correctamente