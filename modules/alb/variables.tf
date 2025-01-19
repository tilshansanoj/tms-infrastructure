variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal"
  type        = bool
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the load balancer"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "The port for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "The protocol for the target group"
  type        = string
}


variable "target_type" {
  description = "The target type for the target group (e.g., instance, ip, lambda)"
  type        = string
}

variable "health_check_protocol" {
  description = "The protocol for the health check"
  type        = string
}

variable "health_check_path" {
  description = "The path for the health check"
  type        = string
}

variable "health_check_interval" {
  description = "The interval for health checks in seconds"
  type        = number
}

variable "health_check_timeout" {
  description = "The timeout for health checks in seconds"
  type        = number
}

variable "healthy_threshold" {
  description = "The number of consecutive health check successes before considering the target healthy"
  type        = number
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures before considering the target unhealthy"
  type        = number
}

variable "listener_port" {
  description = "The port on which the listener listens"
  type        = number
}

variable "listener_protocol" {
  description = "The protocol for the listener (e.g., HTTP, HTTPS)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
