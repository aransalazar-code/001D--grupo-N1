# Crear la VPC con CIDR 10.1.0.0/16 [cite: 57]
resource "aws_vpc" "main" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "AUY1105-duocapp-vpc" 
  }
}

# Subred Pública (Máscara /24) [cite: 58]
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AUY1105-duocapp-subnet-pub"
  }
}

# Subred Privada (Máscara /24) [cite: 58]
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.2.0/24"

  tags = {
    Name = "AUY1105-duocapp-subnet-priv"
  }
}

# Grupos de Seguridad: Permitir solo SSH entrante [cite: 59, 60]
resource "aws_security_group" "ssh_access" {
  name        = "AUY1105-duocapp-sg"
  description = "Permitir trafico SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["152.230.70.146/32"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AUY1105-duocapp-sg"
  }
}

# Internet Gateway para conectividad pública
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "AUY1105-duocapp-igw"
  }
}
#pequeño comentario
