variable "name" {
  description = "Name of the ECS cluster and service"
  type        = string
}

variable "image" {
  description = "Container image to run (e.g., nginx:latest or ECR image)"
  type        = string
}

variable "region" {
  description = "AWS region for CloudWatch logs"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role ARN used by ECS task execution"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)

  validation {
    condition     = length(var.private_subnets) >= 2
    error_message = "At least two private subnets required for high availability."
  }
}

variable "ecs_sg" {
  description = "Security group ID for ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN for attaching ECS service"
  type        = string
}

variable "cpu" {
  description = "CPU units for ECS task"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory (MiB) for ECS task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 2
}

variable "container_port" {
  description = "Port exposed by container"
  type        = number
  default     = 80
}

variable "log_retention_days" {
  description = "CloudWatch log retention period"
  type        = number
  default     = 14
}

variable "min_capacity" {
  description = "Minimum number of ECS tasks"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of ECS tasks"
  type        = number
  default     = 4
}

variable "cpu_target_value" {
  description = "Target CPU utilization percentage for autoscaling"
  type        = number
  default     = 60
}

variable "scale_in_cooldown" {
  description = "Cooldown period (seconds) before scaling in"
  type        = number
  default     = 60
}

variable "scale_out_cooldown" {
  description = "Cooldown period (seconds) before scaling out"
  type        = number
  default     = 60
}

variable "task_role_arn" {
  description = "Security group ID for ECS service"
  type        = string
}