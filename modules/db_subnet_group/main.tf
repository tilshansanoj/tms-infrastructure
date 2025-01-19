resource "aws_db_subnet_group" "main" {
  name       = var.name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.name
  }
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.main.id
}