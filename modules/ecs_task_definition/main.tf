resource "aws_ecs_task_definition" "main" {
  family                   = var.family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
            "name": "tms-backend",
            "image": "058264177299.dkr.ecr.eu-central-1.amazonaws.com/tms:latest",
            "cpu": 256,
            "memory": 512,
            "memoryReservation": 512,
            "portMappings": [
                {
                    "name": "tms-backend-3003-tcp",
                    "containerPort": 3003,
                    "hostPort": 3003,
                    "protocol": "tcp",
                    "appProtocol": "http"
                }
            ],
            "essential": true,
            "environment": [
                {
                    "name": "REDIS_PORT",
                    "value": "6379"
                },
                {
                    "name": "REDIS_HOST",
                    "value": "redis.local"
                }
            ],
            "environmentFiles": [
                {
                    "value": "arn:aws:s3:::s3-tilshansanoj/env-files/.env",
                    "type": "s3"
                }
            ],
            "mountPoints": [],
            "volumesFrom": [],
            "dependsOn": [
                {
                    "containerName": "redis",
                    "condition": "START"
                }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "tms-logs",
                    "mode": "non-blocking",
                    "awslogs-create-group": "true",
                    "max-buffer-size": "25m",
                    "awslogs-region": "eu-central-1",
                    "awslogs-stream-prefix": "ecs"
                },
                "secretOptions": []
            },
            "systemControls": []
        },
        {
            "name": "redis",
            "image": "058264177299.dkr.ecr.ap-southeast-1.amazonaws.com/tms:redis",
            "cpu": 256,
            "memory": 512,
            "memoryReservation": 512,
            "portMappings": [
                {
                    "name": "redis-6379-tcp",
                    "containerPort": 6379,
                    "hostPort": 6379,
                    "protocol": "tcp",
                    "appProtocol": "http"
                }
            ],
            "essential": true,
            "environment": [],
            "environmentFiles": [],
            "mountPoints": [],
            "volumesFrom": [],
            "systemControls": []
        }
  ])

  tags = {
    Name = var.family
  }
}
