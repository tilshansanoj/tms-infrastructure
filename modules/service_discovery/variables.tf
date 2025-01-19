variable "namespace_name" {
  description = "The name of the namespace for service discovery"
  type        = string
}

variable "namespace_description" {
  description = "A description of the namespace"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the namespace is created"
  type        = string
}

variable "service_name" {
  description = "The name of the service in service discovery"
  type        = string
}

variable "dns_record_ttl" {
  description = "The TTL for the DNS records"
  type        = number
  default     = 60
}

variable "health_check_failure_threshold" {
  description = "The failure threshold for the health check"
  type        = number
  default     = 1
}
