# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/vpc.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/security_groups.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/ecs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/load_balancer.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/dynamodb.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/monitoring/cloudwatch.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.setId`: Se invoca `setId` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.setCustomerId`: Se invoca `setCustomerId` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.setItems`: Se invoca `setItems` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.setStatus`: Se invoca `setStatus` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.setCreatedAt`: Se invoca `setCreatedAt` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.setUpdatedAt`: Se invoca `setUpdatedAt` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.getId`: Se invoca `getId` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.getCustomerId`: Se invoca `getCustomerId` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.getItems`: Se invoca `getItems` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.getStatus`: Se invoca `getStatus` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.getCreatedAt`: Se invoca `getCreatedAt` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java` — `OrderEntity.getUpdatedAt`: Se invoca `getUpdatedAt` sobre `OrderEntity`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Backend, Especialidad Desarrollador, Tecnología Java, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261110090352996), Aprovisiona con Terraform la infraestructura AWS que necesita el servicio de ordenes

### Misión / candidato
Versionar la infraestructura del servicio

### Reto
- Tema: Infraestructura como codigo para el servicio de ordenes
- Seniority: senior-l2
- Tipo: practical
- Título: Aprovisionamiento de infraestructura con Terraform para el servicio de órdenes
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Establecer el entorno de Terraform y definir los recursos básicos necesarios para el servicio de órdenes. — entregable (NO resolver): Archivo de configuración de Terraform con recursos básicos definidos.
- Fase 2: Definición de variables y outputs — objetivo: Implementar variables y outputs en Terraform para parametrizar la configuración y facilitar la reutilización. — entregable (NO resolver): Archivo de configuración de Terraform con variables y outputs definidos.
- Fase 3: Implementación de módulos — objetivo: Organizar la configuración en módulos para mejorar la mantenibilidad y reutilización del código. — entregable (NO resolver): Archivo de configuración de Terraform con módulos implementados.
- Fase 4: Validación y versionado de la configuración — objetivo: Validar la configuración de Terraform y versionarla utilizando un sistema de control de versiones. — entregable (NO resolver): Configuración de Terraform validada y versionada, junto con documentación del proceso.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/variables.tf ===
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

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/.gitignore ===
# Archivos de estado de Terraform
*.tfstate
*.tfstate.*
*.tfstate.backup
*.tfstate.locl

# Directorio de estado remoto
.terraform/
.terraform.lock.hcl

# Logs de Terraform
*.log

# Archivos de variables sensibles
*.tfvars.secret
*.tfvars.auto.tfvars

# Archivos de backup
*.bak
*~

# Archivos de IDE
.idea/
.vscode/
*.swp
*.swo
*~

# Archivos del sistema operativo
.DS_Store
Thumbs.db

# Certificados y claves sensibles (excluir los que no deben estar en repo)
*.pem
*.key
*.crt
*.p12
*.jks

# Archivos de configuración local
local.tf
override.tf
override.tf.json

# Plan files
*.plan
*.plan.json

# Credentials file
credentials.tfvars
secrets.tfvars

// === ARCHIVO: infra/modules/network/vpc.tf ===
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

// === ARCHIVO: infra/modules/network/security_groups.tf ===
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

// === ARCHIVO: infra/modules/compute/ecs.tf ===
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

// === ARCHIVO: infra/modules/compute/load_balancer.tf ===
# Módulo para la creación del Application Load Balancer y listeners para el servicio
# Superficie de práctica: completar la configuración del ALB y listeners

variable "lb_name" {
  description = "Nombre del Application Load Balancer"
  type        = string
}

variable "target_group_port" {
  description = "Puerto del target group"
  type        = number
  default     = 8080
}

variable "health_check_path" {
  description = "Ruta para el health check"
  type        = string
  default     = "/health"
}

variable "certificate_arn" {
  description = "ARN del certificado ACM para HTTPS"
  type        = string
  default     = ""
}

resource "aws_lb" "this" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = true

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "${var.lb_name}-tg"
  port     = var.target_group_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = var.health_check_path
    matcher             = "200"
  }

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_listener" "https" {
  count             = var.certificate_arn != "" ? 1 : 0
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "Nombre DNS del ALB"
  value       = aws_lb.this.dns_name
}

// === ARCHIVO: infra/modules/database/dynamodb.tf ===
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

// === ARCHIVO: infra/modules/monitoring/cloudwatch.tf ===
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

// === ARCHIVO: infra/modules/network/outputs.tf ===
# Outputs del módulo de red para exponer IDs de VPC y subredes
# Este archivo es superficie de práctica - el estudiante debe completar los outputs

output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.this.id # TODO(reto): completar referencia
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id # TODO(reto): completar referencia
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id # TODO(reto): completar referencia
}

output "security_group_id" {
  description = "ID del security group"
  value       = aws_security_group.this.id # TODO(reto): completar referencia
}

// === ARCHIVO: infra/modules/compute/outputs.tf ===
# Outputs del módulo de cómputo para exponer DNS del load balancer y ARN del cluster ECS
# Este archivo es superficie de práctica - el estudiante debe completar los outputs

output "ecs_cluster_arn" {
  description = "ARN del cluster ECS"
  value       = aws_ecs_cluster.this.arn # TODO(reto): completar referencia
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  value       = aws_ecs_cluster.this.name # TODO(reto): completar referencia
}

output "load_balancer_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = aws_lb.this.dns_name # TODO(reto): completar referencia
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.this.arn # TODO(reto): completar referencia
}

output "target_group_arn" {
  description = "ARN del target group"
  value       = aws_lb_target_group.this.arn # TODO(reto): completar referencia
}

// === ARCHIVO: infra/modules/database/outputs.tf ===
# Outputs del módulo de base de datos para exponer ARN de la tabla DynamoDB
# Este archivo es superficie de práctica - el estudiante debe completar los outputs

output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.arn # TODO(reto): completar referencia
}

output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = aws_dynamodb_table.this.name # TODO(reto): completar referencia
}

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0"
}

// === ARCHIVO: infra/main.tf ===
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

// === ARCHIVO: infra/outputs.tf ===
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

output "ecs_cluster_arn" {
  description = "ARN del cluster ECS"
  value       = module.ecs.ecs_cluster_arn
}

output "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  value       = module.ecs.ecs_cluster_name
}

output "load_balancer_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = module.load_balancer.load_balancer_dns_name
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.load_balancer.load_balancer_arn
}

output "target_group_arn" {
  description = "ARN del target group del ALB"
  value       = module.load_balancer.target_group_arn
}

output "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  value       = module.dynamodb.dynamodb_table_name
}

output "dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB"
  value       = module.dynamodb.dynamodb_table_arn
}

output "sns_topic_arn" {
  description = "ARN del topic SNS para alarmas"
  value       = module.monitoring.sns_topic_arn
}

output "dashboard_name" {
  description = "Nombre del dashboard de CloudWatch"
  value       = module.monitoring.dashboard_name
}

output "environment" {
  description = "Entorno de despliegue"
  value       = var.environment
  sensitive   = false
}

output "aws_region" {
  description = "Región de AWS"
  value       = var.aws_region
  sensitive   = false
}

// === ARCHIVO: api/pom.xml ===
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.5.6</version>
        <relativePath/>
    </parent>
    <groupId>com.orders</groupId>
    <artifactId>api</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>orders-api</name>
    <description>API para gestión de órdenes</description>
    <properties>
        <java.version>21</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.34</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>software.amazon.awssdk</groupId>
            <artifactId>dynamodb</artifactId>
            <version>2.57.12</version>
        </dependency>
        <dependency>
            <groupId>software.amazon.awssdk</groupId>
            <artifactId>dynamodb-enhanced</artifactId>
            <version>2.57.12</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>

// === ARCHIVO: api/src/main/resources/application.yml ===
spring:
  application:
    name: orders-api
  datasource:
    url: ${DB_URL:jdbc:postgresql://localhost:5432/orders_db}
    username: ${DB_USERNAME:postgres}
    password: ${DB_PASSWORD:postgres}
    driver-class-name: org.postgresql.Driver
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect
        format_sql: true

server:
  port: 8080

management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics
  endpoint:
    health:
      show-details: always

aws:
  region: ${AWS_REGION:us-east-1}
  dynamodb:
    endpoint: ${AWS_DYNAMODB_ENDPOINT:}
    orders-table: ${AWS_DYNAMODB_ORDERS_TABLE:orders}

// === ARCHIVO: api/src/main/java/com/orders/api/domain/Order.java ===
package com.orders.api.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private UUID id;
    private String customerId;
    private List<OrderItem> items;
    private OrderStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public enum OrderStatus {
        PENDING,
        PROCESSING,
        COMPLETED,
        CANCELLED
    }

    @Getter
    @Setter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class OrderItem {
        private UUID productId;
        private int quantity;
        private double price;
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/domain/OrderRepository.java ===
package com.orders.api.domain;

import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    Order save(Order order);
    Optional<Order> findById(UUID id);
    Order update(Order order);
    void deleteById(UUID id);
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/OrderDynamoDBRepository.java ===
package com.orders.api.infrastructure;

import com.orders.api.domain.Order;
import com.orders.api.domain.OrderRepository;
import com.orders.api.domain.Order.OrderItem;
import com.orders.api.domain.Order.OrderStatus;
import org.springframework.stereotype.Repository;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.Key;
import software.amazon.awssdk.enhanced.dynamodb.TableSchema;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;
import software.amazon.awssdk.services.dynamodb.model.DynamoDbException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public class OrderDynamoDBRepository implements OrderRepository {

    private final DynamoDbTable<OrderEntity> orderTable;

    public OrderDynamoDBRepository(DynamoDbEnhancedClient dynamoDbEnhancedClient) {
        this.orderTable = dynamoDbEnhancedClient.table("Orders", TableSchema.fromBean(OrderEntity.class));
    }

    @Override
    public Order save(Order order) {
        OrderEntity entity = toEntity(order);
        orderTable.putItem(entity);
        return toDomain(entity);
    }

    @Override
    public Optional<Order> findById(UUID id) {
        try {
            OrderEntity entity = orderTable.getItem(Key.builder().partitionValue(id.toString()).build());
            return Optional.ofNullable(entity).map(this::toDomain);
        } catch (DynamoDbException e) {
            throw new OrderPersistenceException("Error retrieving order from DynamoDB", e);
        }
    }

    @Override
    public Order update(Order order) {
        OrderEntity entity = toEntity(order);
        orderTable.updateItem(entity);
        return toDomain(entity);
    }

    @Override
    public void deleteById(UUID id) {
        orderTable.deleteItem(Key.builder().partitionValue(id.toString()).build());
    }

    private OrderEntity toEntity(Order order) {
        OrderEntity entity = new OrderEntity();
        entity.setId(order.getId().toString());
        entity.setCustomerId(order.getCustomerId());
        entity.setItems(order.getItems());
        entity.setStatus(order.getStatus().name());
        entity.setCreatedAt(order.getCreatedAt());
        entity.setUpdatedAt(order.getUpdatedAt());
        return entity;
    }

    private Order toDomain(OrderEntity entity) {
        return Order.builder()
                .id(UUID.fromString(entity.getId()))
                .customerId(entity.getCustomerId())
                .items(entity.getItems())
                .status(OrderStatus.valueOf(entity.getStatus()))
                .createdAt(entity.getCreatedAt())
                .updatedAt(entity.getUpdatedAt())
                .build();
    }

    @DynamoDbBean
    public static class OrderEntity {
        private String id;
        private String customerId;
        private List<OrderItem> items;
        private String status;
        private LocalDateTime createdAt;
        private LocalDateTime updatedAt;

        @DynamoDbPartitionKey
        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getCustomerId() {
            return customerId;
        }

        public void setCustomerId(String customerId) {
            this.customerId = customerId;
        }

        public List<OrderItem> getItems() {
            return items;
        }

        public void setItems(List<OrderItem> items) {
            this.items = items;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public LocalDateTime getCreatedAt() {
            return createdAt;
        }

        public void setCreatedAt(LocalDateTime createdAt) {
            this.createdAt = createdAt;
        }

        public LocalDateTime getUpdatedAt() {
            return updatedAt;
        }

        public void setUpdatedAt(LocalDateTime updatedAt) {
            this.updatedAt = updatedAt;
        }
    }

    public static class OrderPersistenceException extends RuntimeException {
        public OrderPersistenceException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/dto/OrderRequest.java ===
package com.orders.api.infrastructure.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public record OrderRequest(
    @NotBlank(message = "El ID del cliente es obligatorio")
    String customerId,
    @NotEmpty(message = "La orden debe contener al menos un elemento")
    @Valid
    List<OrderItemRequest> items
) {
    public record OrderItemRequest(
        @NotBlank(message = "El ID del producto es obligatorio")
        String productId,
        @NotNull(message = "La cantidad es obligatoria")
        Integer quantity,
        @NotNull(message = "El precio es obligatorio")
        BigDecimal price
    ) {}
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/dto/OrderResponse.java ===
package com.orders.api.infrastructure.dto;

import com.orders.api.domain.Order;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public record OrderResponse(
    String id,
    String customerId,
    List<OrderItemResponse> items,
    String status,
    BigDecimal total,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public record OrderItemResponse(
        String productId,
        Integer quantity,
        BigDecimal price,
        BigDecimal subtotal
    ) {}

    public static OrderResponse fromDomain(Order order) {
        if (order == null) {
            return null;
        }
        
        BigDecimal total = order.getItems() != null 
            ? order.getItems().stream()
                .map(item -> BigDecimal.valueOf(item.getPrice()).multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add)
            : BigDecimal.ZERO;

        List<OrderItemResponse> itemResponses = order.getItems() != null
            ? order.getItems().stream()
                .map(item -> {
                    BigDecimal itemPrice = BigDecimal.valueOf(item.getPrice());
                    BigDecimal itemSubtotal = itemPrice.multiply(BigDecimal.valueOf(item.getQuantity()));
                    return new OrderItemResponse(
                        item.getProductId(),
                        item.getQuantity(),
                        itemPrice,
                        itemSubtotal
                    );
                })
                .collect(Collectors.toList())
            : List.of();

        return new OrderResponse(
            order.getId() != null ? order.getId().toString() : null,
            order.getCustomerId(),
            itemResponses,
            order.getStatus() != null ? order.getStatus().name() : "UNKNOWN",
            total,
            order.getCreatedAt(),
            order.getUpdatedAt()
        );
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/application/OrderService.java ===
package com.orders.api.application;

import com.orders.api.domain.Order;
import com.orders.api.domain.Order.OrderItem;
import com.orders.api.domain.Order.OrderStatus;
import com.orders.api.domain.OrderRepository;
import com.orders.api.infrastructure.dto.OrderRequest;
import com.orders.api.infrastructure.dto.OrderResponse;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponse createOrder(OrderRequest request) {
        if (request == null) {
            throw new IllegalArgumentException("La solicitud de orden no puede ser nula");
        }

        Order order = new Order();
        order.setId(UUID.randomUUID());
        order.setCustomerId(request.customerId());
        order.setStatus(OrderStatus.PENDING);
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());

        List<OrderItem> items = request.items().stream()
            .map(itemReq -> {
                OrderItem item = new OrderItem();
                item.setProductId(itemReq.productId());
                item.setQuantity(itemReq.quantity());
                item.setPrice(itemReq.price().doubleValue());
                return item;
            })
            .collect(Collectors.toList());
        order.setItems(items);

        Order savedOrder = orderRepository.save(order);
        return OrderResponse.fromDomain(savedOrder);
    }

    public Optional<OrderResponse> getOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        return orderRepository.findById(id)
            .map(OrderResponse::fromDomain);
    }

    public Optional<OrderResponse> updateOrder(UUID id, OrderRequest request) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        if (request == null) {
            throw new IllegalArgumentException("La solicitud de orden no puede ser nula");
        }

        Optional<Order> existingOrderOpt = orderRepository.findById(id);
        if (existingOrderOpt.isEmpty()) {
            return Optional.empty();
        }

        Order existingOrder = existingOrderOpt.get();
        existingOrder.setCustomerId(request.customerId());
        existingOrder.setUpdatedAt(LocalDateTime.now());

        List<OrderItem> items = request.items().stream()
            .map(itemReq -> {
                OrderItem item = new OrderItem();
                item.setProductId(itemReq.productId());
                item.setQuantity(itemReq.quantity());
                item.setPrice(itemReq.price().doubleValue());
                return item;
            })
            .collect(Collectors.toList());
        existingOrder.setItems(items);

        Order updatedOrder = orderRepository.update(existingOrder);
        return Optional.of(OrderResponse.fromDomain(updatedOrder));
    }

    public boolean deleteOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> existingOrder = orderRepository.findById(id);
        if (existingOrder.isEmpty()) {
            return false;
        }

        orderRepository.deleteById(id);
        return true;
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/config/AWSConfig.java ===
package com.orders.api.infrastructure.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.DefaultCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;

import java.net.URI;

@Configuration
public class AWSConfig {

    @Value("${aws.dynamodb.endpoint:#{null}}")
    private String dynamoDbEndpoint;

    @Value("${aws.region:us-east-1}")
    private String awsRegion;

    @Value("${aws.access.key.id:#{null}}")
    private String accessKeyId;

    @Value("${aws.secret.access.key:#{null}}")
    private String secretAccessKey;

    @Bean
    public DynamoDbClient dynamoDbClient() {
        var builder = DynamoDbClient.builder()
                .region(Region.of(awsRegion));

        if (dynamoDbEndpoint != null && !dynamoDbEndpoint.isBlank()) {
            builder.endpointOverride(URI.create(dynamoDbEndpoint));
        }

        if (accessKeyId != null && secretAccessKey != null 
                && !accessKeyId.isBlank() && !secretAccessKey.isBlank()) {
            builder.credentialsProvider(StaticCredentialsProvider.create(
                    AwsBasicCredentials.create(accessKeyId, secretAccessKey)
            ));
        } else {
            builder.credentialsProvider(DefaultCredentialsProvider.create());
        }

        return builder.build();
    }

    @Bean
    public DynamoDbEnhancedClient dynamoDbEnhancedClient(DynamoDbClient dynamoDbClient) {
        return DynamoDbEnhancedClient.builder()
                .dynamoDbClient(dynamoDbClient)
                .build();
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/Application.java ===
package com.orders.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import jakarta.persistence.EntityNotFoundException;
import com.orders.api.infrastructure.OrderDynamoDBRepository.OrderPersistenceException;

import java.util.Map;
import java.util.UUID;

@SpringBootApplication
@ComponentScan(basePackages = {"com.orders.api"})
@EntityScan(basePackages = {"com.orders.api.domain"})
@EnableJpaRepositories(basePackages = {"com.orders.api.domain"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @RestController
    public static class HealthController {

        @org.springframework.web.bind.annotation.GetMapping("/health")
        public ResponseEntity<Map<String, Object>> health() {
            return ResponseEntity.ok(Map.of(
                "status", "UP",
                "service", "orders-api",
                "timestamp", java.time.Instant.now().toString()
            ));
        }
    }

    @RestControllerAdvice
    public static class GlobalExceptionHandler {

        @ExceptionHandler(EntityNotFoundException.class)
        public ResponseEntity<Map<String, String>> handleEntityNotFound(EntityNotFoundException ex) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body(Map.of("error", "Entity not found", "message", ex.getMessage()));
        }

        @ExceptionHandler(IllegalArgumentException.class)
        public ResponseEntity<Map<String, String>> handleIllegalArgument(IllegalArgumentException ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(Map.of("error", "Invalid argument", "message", ex.getMessage()));
        }

        @ExceptionHandler(MethodArgumentTypeMismatchException.class)
        public ResponseEntity<Map<String, String>> handleTypeMismatch(MethodArgumentTypeMismatchException ex) {
            String message = String.format("Invalid value '%s' for parameter '%s'", 
                ex.getValue(), ex.getName());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(Map.of("error", "Type mismatch", "message", message));
        }

        @ExceptionHandler(HttpMessageNotReadableException.class)
        public ResponseEntity<Map<String, String>> handleUnreadableMessage(HttpMessageNotReadableException ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(Map.of("error", "Malformed request body", "message", "The request body is invalid or malformed"));
        }

        @ExceptionHandler(OrderPersistenceException.class)
        public ResponseEntity<Map<String, String>> handlePersistenceException(OrderPersistenceException ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "Database error", "message", ex.getMessage()));
        }

        @ExceptionHandler(Exception.class)
        public ResponseEntity<Map<String, String>> handleGenericException(Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "Internal server error", "message", "An unexpected error occurred"));
        }
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/OrderController.java ===
package com.orders.api.infrastructure;


import com.orders.api.domain.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.orders.api.application.OrderService;
import com.orders.api.infrastructure.dto.OrderRequest;
import com.orders.api.infrastructure.dto.OrderResponse;

import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponse> createOrder(@Valid @RequestBody OrderRequest request) {
        try {
            OrderResponse response = orderService.createOrder(request);
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (IllegalArgumentException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage(), e);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponse> getOrder(@PathVariable UUID id) {
        return orderService.getOrder(id)
            .map(ResponseEntity::ok)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, 
                "Order not found with id: " + id));
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderResponse> updateOrder(
            @PathVariable UUID id, 
            @Valid @RequestBody OrderRequest request) {
        return orderService.updateOrder(id, request)
            .map(ResponseEntity::ok)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, 
                "Order not found with id: " + id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable UUID id) {
        boolean deleted = orderService.deleteOrder(id);
        if (!deleted) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, 
                "Order not found with id: " + id);
        }
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<OrderResponse>> getAllOrders() {
        throw new ResponseStatusException(HttpStatus.NOT_IMPLEMENTED, 
            "List all orders endpoint not yet implemented");
    }
}
```
