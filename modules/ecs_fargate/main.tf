resource "aws_ecs_service" "fargate_service" {
  name            = var.service_name
  cluster         = var.cluster_name
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  availability_zone_rebalancing = "DISABLED"

  launch_type = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups = var.security_group_id
    assign_public_ip = true
  }

  service_registries {
    registry_arn = var.service_discovery_arn
  }

}