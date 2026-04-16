Changelog
Todos los cambios notables en este proyecto serán documentados en este archivo.
[1.1.0] - 2026-04-16
Añadido
Automatización: Creación de workflows en GitHub Actions (main.yml, terraform.yml, checkov.yml) para análisis automático del código.
Análisis estático: Integración de TFLint para validación de buenas prácticas en Terraform.
Análisis de seguridad: Integración de Checkov para detección de vulnerabilidades en la infraestructura como código.
Validación: Implementación de etapa de validación usando terraform validate dentro del pipeline.
Mejorado
Estructura del proyecto: Organización de workflows reutilizables para mejorar la mantenibilidad del pipeline.
[1.0.0] - 2026-04-16
Añadido
Infraestructura Base: Creación de archivos provider.tf, vpc.tf y ec2.tf.
Redes: Configuración de VPC con CIDR 10.1.0.0/16 y subredes con máscara /24.
Seguridad: Implementación de Security Group permitiendo únicamente tráfico SSH (puerto 22).
Cómputo: Definición de instancia EC2 tipo t2.micro con SO Ubuntu 24.04 LTS.
Repositorio: Configuración inicial con archivos .gitignore y README.md.
