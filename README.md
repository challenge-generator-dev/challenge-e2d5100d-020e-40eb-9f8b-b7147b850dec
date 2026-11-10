# Aprovisionamiento de infraestructura con Terraform para el servicio de órdenes

El equipo de desarrollo necesita aprovisionar la infraestructura AWS requerida para el servicio de órdenes utilizando Terraform. El objetivo es versionar la configuración de la infraestructura para asegurar consistencia y replicabilidad en el despliegue del servicio.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el servicio de ordenes |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Establecer el entorno de Terraform y definir los recursos básicos necesarios para el servicio de órdenes.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos AWS necesarios para el servicio de órdenes.
- Configurar el archivo principal de Terraform para definir estos recursos.
- Verificar que la configuración inicial permite la creación de recursos sin errores.

**Entregable:** Archivo de configuración de Terraform con recursos básicos definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Estructura de un proyecto de Terraform.
- Recursos comunes de AWS en Terraform.

</details>

### Fase 2: Definición de variables y outputs

**Objetivo:** Implementar variables y outputs en Terraform para parametrizar la configuración y facilitar la reutilización.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Definir variables para los parámetros comunes de los recursos.
- Crear outputs para exponer información relevante del despliegue.
- Verificar que las variables y outputs funcionan correctamente y mejoran la modularidad del código.

**Entregable:** Archivo de configuración de Terraform con variables y outputs definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de variables en Terraform.
- Creación de outputs en Terraform.

</details>

### Fase 3: Implementación de módulos

**Objetivo:** Organizar la configuración en módulos para mejorar la mantenibilidad y reutilización del código.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Crear módulos para agrupar recursos relacionados.
- Utilizar los módulos en la configuración principal de Terraform.
- Verificar que los módulos funcionan correctamente y mejoran la organización del código.

**Entregable:** Archivo de configuración de Terraform con módulos implementados.

<details>
<summary>Pistas de conocimiento</summary>

- Creación y uso de módulos en Terraform.
- Beneficios de la modularización en Terraform.

</details>

### Fase 4: Validación y versionado de la configuración

**Objetivo:** Validar la configuración de Terraform y versionarla utilizando un sistema de control de versiones.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Ejecutar comandos de Terraform para validar la configuración.
- Versionar la configuración utilizando Git.
- Verificar que la configuración validada y versionada permite un despliegue consistente y replicable.
- Documentar el proceso de validación y versionado.

**Entregable:** Configuración de Terraform validada y versionada, junto con documentación del proceso.

<details>
<summary>Pistas de conocimiento</summary>

- Comandos de Terraform para validación.
- Uso de Git para versionar proyectos.
- Java: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este contexto?
- **paraQueSirve**: ¿Para qué sirve versionar la configuración de Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para aprovisionar infraestructura en AWS?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica la modularización de la configuración de Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform con recursos básicos definidos.
- Definición de variables y outputs en Terraform.
- Implementación de módulos en la configuración de Terraform.
- Validación y versionado de la configuración de Terraform.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
