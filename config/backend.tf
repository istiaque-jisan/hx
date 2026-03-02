##this connects terraform to remote state

terraform {
  backend "s3" {
    bucket         = "mycompany-prod-terraform-state"
    key            = "ecs-service/prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock-prod"
    encrypt        = true
  }

  required_version = "~> 1.8.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}