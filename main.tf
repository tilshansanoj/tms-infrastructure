terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}


module "vpc" {
  source = "./modules/vpc"

  vpc_name        = "my-vpc"
  cidr_block      = "10.0.0.0/16"
  azs             =  ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  
}
module "security_groups" {
  source = "./modules/security_groups"


  vpc_id = module.vpc.vpc_id

  public_ports = [3003]
  private_ports = [5432]
}

module "db_subnet_group" {
  source = "./modules/db_subnet_group"

  name       = "my-db-subnet-group"
  subnet_ids = module.vpc.private_subnet_ids
}

# module "rds" {
#   source = "./modules/rds"

#   db_identifier = "my-postgres-db"
#   storage      = 30
#   db_engine                 = "postgres"
#   db_engine_version         = "16.3"
#   db_instance_class         = "db.t3.micro"
#   db_username               = "admin"
#   db_password               = "adminpassword"
#   port                      = 5432
#   db_vpc_security_group_ids = [module.security_groups.private_security_group]
#   subnet_group_name         = module.db_subnet_group.db_subnet_group_name
# }

# module "elasticache" {
#   source = "./modules/elasticache"

#   cluster_id            = "my-elasticache-cluster"
#   engine                = "redis"
#   node_type             = "cache.t3.micro"
#   num_cache_nodes       = 1
#   subnet_ids            = module.vpc.private_subnet_ids
#   security_group_ids    = [module.security_groups.private_security_group]
# }

module "service_discovery" {
  source                     = "./modules/service_discovery"
  namespace_name             = "local"
  namespace_description      = "Service Discovery Namespace for my services"
  vpc_id                     = module.vpc.vpc_id
  service_name               = "redis"
  dns_record_ttl             = 15
  health_check_failure_threshold = 1
}

# module "alb" {
#   source = "./modules/alb"

#   lb_name                = "my-alb"
#   internal               = false
#   security_group_ids     = [module.security_groups.public_security_group]
#   subnet_ids             = module.vpc.public_subnet_ids
#   target_group_name      = "my-target-group"
#   target_group_port      = 3003
#   target_group_protocol  = "HTTP"
#   vpc_id                 = module.vpc.vpc_id
#   target_type            = "ip"
#   health_check_protocol  = "HTTP"
#   health_check_path      = "/"
#   health_check_interval  = 30
#   health_check_timeout   = 5
#   healthy_threshold      = 2
#   unhealthy_threshold    = 2
#   listener_port          = 80
#   listener_protocol      = "HTTP"
#   vpc_name         = "my-vpc"
#   public_subnet_ids = module.vpc.public_subnet_ids
# }

module "ecs_fargate_service" {
  source = "./modules/ecs_fargate"

  cluster_name          = "my-ecs-cluster"
  service_name          = "backend"
  task_definition_arn   = module.ecs_task_definition.task_definition_arn
  desired_count         = 1
  subnet_ids            = module.vpc.public_subnet_ids
  security_group_id    = [module.security_groups.public_security_group]
  service_discovery_arn = module.service_discovery.service_discovery_arn
}


module "iam_role" {
  source     = "./modules/iam"
  role_name  = "task-execution-role"
}

module "ecs_cluster" {
  source       = "./modules/ecs_cluster"
  cluster_name = "my-ecs-cluster"
}

module "ecs_task_definition" {
  source             = "./modules/ecs_task_definition"
  family             = "my-fargate-task"
  cpu                = "512" 
  memory             = "1024" 
  execution_role_arn = "arn:aws:iam::058264177299:role/tms-ecs-task-role"

}

