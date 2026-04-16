# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

## [1.2.0] - 2026-04-16

### Añadido
-**Definición de Políticas (OPA)**: Implementación de reglas en lenguaje Rego para prohibir el acceso SSH público y restringir el uso exclusivo de instancias tipo `t2.micro`.
- **Validación de Políticas**: Integración de un nuevo paso en el pipeline de GitHub Actions para ejecutar pruebas automáticas de cumplimiento normativo mediante Open Policy Agent.

### Corregido
-**Seguridad Perimetral**: Se restringe el acceso SSH en `vpc.tf` de `0.0.0.0/0` a una IP específica (`152.230.70.146/32`) para mitigar vulnerabilidades y cumplir con la política de seguridad interna.
-**Nomenclatura Oficial**: Ajuste de todos los recursos (VPC, Subredes, Security Groups, EC2) de la sigla temporal `001D` a la sigla oficial de la asignatura `AUY1105`.

## [1.1.0] - 2026-04-16

### Añadido
- **Automatización**: Creación de workflows en GitHub Actions (`main.yml`, `terraform.yml`, `checkov.yml`) para el análisis automático del código en cada Pull Request.
- **Análisis Estático**: Integración de **TFLint** para la validación de mejores prácticas de codificación en Terraform.
- **Análisis de Seguridad**: Integración de **Checkov** para la detección proactiva de vulnerabilidades en la infraestructura como código.
- **Validación de Código**: Implementación de la etapa de validación técnica mediante el comando `terraform validate` dentro del pipeline.

### Mejorado
- **Estructura del Proyecto**: Organización de workflows reutilizables para mejorar la mantenibilidad y escalabilidad del pipeline de CI/CD

## [1.0.0] - 2026-04-16

### Añadido
- **Infraestructura Base**: Creación de archivos fundamentales `provider.tf`, `vpc.tf` y `ec2.tf`.
- **Redes**: Configuración de VPC con CIDR `10.1.0.0/16` y segmentación de subredes con máscara `/24`.
- **Seguridad Inicial**: Configuración de Security Group permitiendo únicamente el tráfico entrante a través del protocolo SSH (puerto 22).
- **Cómputo**: Definición de instancia EC2 con sistema operativo Ubuntu 24.04 LTS y tipo de instancia `t2.micro`.
- **Repositorio**: Configuración inicial del entorno de trabajo incluyendo archivos `.gitignore` y `README.md`.
