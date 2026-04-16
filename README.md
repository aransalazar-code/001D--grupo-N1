# AUY1105 - Grupo N1

## Proyecto: Infraestructura como Código con Terraform + CI/CD

---

## Descripción del proyecto

Este repositorio contiene la implementación de una infraestructura en AWS utilizando **Terraform**, junto con un pipeline automatizado en **GitHub Actions** para validar calidad, seguridad y buenas prácticas del código.

El objetivo es aplicar conceptos de **Infraestructura como Código (IaC)**, automatización y seguridad mediante herramientas modernas.

---

## Objetivos

* Definir infraestructura en AWS usando Terraform
* Implementar un pipeline CI/CD automatizado
* Aplicar análisis de calidad y seguridad al código
* Integrar políticas de seguridad con Open Policy Agent (OPA)
* Utilizar buenas prácticas de trabajo colaborativo con GitHub

---

## Infraestructura implementada

La infraestructura incluye:

* **VPC** con CIDR `10.1.0.0/16`
* **Subred pública** (`10.1.1.0/24`)
* **Subred privada** (`10.1.2.0/24`)
* **Security Group** con acceso SSH
* **Instancia EC2** tipo `t2.micro` con Ubuntu 24.04 LTS
* **Internet Gateway** para conectividad

Todos los recursos siguen la nomenclatura:

AUY1105-duocapp-<tipo-recurso>

---

## ⚙️ Automatización (CI/CD)

Se implementó un pipeline con **GitHub Actions** que se ejecuta en cada Pull Request hacia la rama `main`.

### Etapas del pipeline:

1. **Análisis estático (TFLint)**
   Verifica buenas prácticas en el código Terraform

2. **Análisis de seguridad (Checkov)**
   Detecta vulnerabilidades en la infraestructura

3. **Validación de Terraform**
   Ejecuta `terraform validate`

4. **Políticas de seguridad (OPA)**
   Evalúa reglas definidas para evitar configuraciones inseguras

---

##  Políticas de seguridad (OPA)

Se implementaron políticas utilizando **Open Policy Agent** para:

*  Bloquear acceso SSH público (`0.0.0.0/0`)
*  Restringir el tipo de instancia a `t2.micro`

Estas políticas se ejecutan automáticamente en el pipeline y pueden bloquear cambios inseguros.

---

##  Uso básico

1. Clonar el repositorio
2. Inicializar Terraform:

   ```bash
   terraform init
   ```
3. Validar configuración:

   ```bash
   terraform validate
   ```
4. Generar plan:

   ```bash
   terraform plan
   ```

---

## Flujo de trabajo

* Se utilizan ramas por funcionalidad (`automatizacion`, `documentacion`, `policy`)
* Cada cambio se integra mediante **Pull Request**
* Los PR son revisados antes de ser fusionados a `main`

---

## Control de cambios

Todos los cambios relevantes se documentan en el archivo `CHANGELOG.md`.

---

##  Integrantes

* Aranza Salazar
* Constanza Retamal
