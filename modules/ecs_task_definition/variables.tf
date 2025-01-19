variable "family" {
  description = "The name of the task family"
  type        = string
}

variable "cpu" {
  description = "The amount of CPU to allocate to the task"
  type        = string
}

variable "memory" {
  description = "The amount of memory to allocate to the task"
  type        = string
}

variable "execution_role_arn" {
  description = "The ARN of the task execution role"
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the IAM role for the task"
  type        = string
  default     = null
}