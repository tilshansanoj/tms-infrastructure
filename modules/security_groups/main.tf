resource "aws_security_group" "public" {
  name        = "public-sg"
  description = "Security group for public subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.public_ports[0]
    to_port     = var.public_ports[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

resource "aws_security_group" "private" {
  name        = "private-sg"
  description = "Security group for private subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.private_ports[0]
    to_port     = var.private_ports[0]
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}