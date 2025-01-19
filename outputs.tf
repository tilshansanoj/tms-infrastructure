output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnet_ids
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}

output "db_subnet_group" {
  value = module.db_subnet_group
}

# output "elasticache_cluster_id" {
#   description = "The ID of the Elasticache cluster"
#   value       = module.elasticache
# }

output "alb_arn" {
  value = module.alb.alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "aws_lb_target_group" {
  value = module.alb.target_group_arn
}

output "task_execution_role_arn" {
  value = module.iam_role.iam_role_arn
}

output "task_execution_role_name" {
  value = module.iam_role.iam_role_name
}

output "ecs_cluster_arn" {
  value = module.ecs_cluster.ecs_cluster_arn
}

output "ecs_cluster_id" {
  value = module.ecs_cluster.ecs_cluster_id
}

output "task_definition_arn" {
  value = module.ecs_task_definition.task_definition_arn
}

output "task_definition_family" {
  value = module.ecs_task_definition.task_definition_family
}