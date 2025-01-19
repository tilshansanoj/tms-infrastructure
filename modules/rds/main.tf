resource "aws_db_instance" "postgres" {
  allocated_storage      = var.storage
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  identifier             = var.db_identifier
  username               = var.db_username
  password               = var.db_password
  port                   = var.port
  vpc_security_group_ids = var.db_vpc_security_group_ids
  db_subnet_group_name   = var.subnet_group_name
  skip_final_snapshot    = true

  tags = {
    Name = var.db_identifier
  }
}