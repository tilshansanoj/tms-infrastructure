# Create a Service Discovery Namespace
resource "aws_service_discovery_private_dns_namespace" "main" {
  name        = var.namespace_name
  description = var.namespace_description
  vpc         = var.vpc_id

  tags = {
    Name = var.namespace_name
  }
}

# Create a Service Discovery Service
resource "aws_service_discovery_service" "main" {
  name = var.service_name

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.main.id

    dns_records {
      type  = "A"
      ttl   = var.dns_record_ttl
    }
  }

  health_check_custom_config {
    failure_threshold = var.health_check_failure_threshold
  }

  tags = {
    Name = var.service_name
  }
}

