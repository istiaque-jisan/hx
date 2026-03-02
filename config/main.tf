provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}




module "network" {
  source   = "../../modules/network"
  vpc_cidr = var.vpc_cidr
  azs      = data.aws_availability_zones.available.names
}




module "security" {
  source = "../../modules/security"
  vpc_id = module.network.vpc_id
}



module "alb" {
  source         = "../../modules/alb"
  vpc_id         = module.network.vpc_id
  public_subnets = module.network.public_subnets
  alb_sg         = module.security.alb_sg_id
  bucket = "${var.environment}-alb-logs"
  environment    = var.environment
}


module "ecs" {
  source = "../../modules/ecs"

  name               = "${var.environment}-service"
  environment        = var.environment  
  log_retention_days = 14                
  image              = "nginx:latest"
  region             = var.region
  execution_role_arn = var.execution_role_arn

  private_subnets  = module.network.private_subnets
  ecs_sg           = module.security.ecs_sg_id
  target_group_arn = module.alb.target_group_arn

  cpu           = var.cpu
  memory        = var.memory
  desired_count = var.desired_count

  min_capacity     = var.min_capacity
  max_capacity     = var.max_capacity
  cpu_target_value = var.cpu_target_value
  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}