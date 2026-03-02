variable "vpc_id" {
  description = "VPC ID where the ALB and target group will be created"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)

  validation {
    condition     = length(var.public_subnets) >= 2
    error_message = "At least two public subnets are required for high availability."
  }
}

variable "alb_sg" {
  description = "Security group ID attached to the ALB"
  type        = string
}

variable "environment" {
  type = string
}