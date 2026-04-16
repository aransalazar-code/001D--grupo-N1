package terraform.security

# Bloquear acceso SSH público
deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_security_group"

  ingress := resource.change.after.ingress[_]
  ingress.from_port == 22
  ingress.to_port == 22

  cidr := ingress.cidr_blocks[_]
  cidr == "0.0.0.0/0"

  msg = "No se permite acceso SSH público (0.0.0.0/0)"
}

# Solo permitir instancias t2.micro
deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"

  instance_type := resource.change.after.instance_type
  instance_type != "t2.micro"

  msg = sprintf("Tipo de instancia no permitido: %s", [instance_type])
}
