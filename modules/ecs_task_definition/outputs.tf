output "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  value       = aws_ecs_task_definition.main.arn
}

output "task_definition_family" {
  description = "The family of the ECS task definition"
  value       = aws_ecs_task_definition.main.family
}
