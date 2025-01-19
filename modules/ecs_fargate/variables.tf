variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  type        = string
}

variable "desired_count" {
  description = "The desired number of ECS tasks"
  type        = number
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "The list of security group IDs for the ECS service"
  type        = set(string)
}



variable "service_discovery_arn" {
  description = "The ARN of the service for service discovery"
  type        = string
}
