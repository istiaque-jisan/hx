region               = ""
environment          = ""
execution_role_arn   = "arn:aws:iam::123456789012:role/ecsExecutionRole"
vpc_cidr             = "10.0.0.0/16"

cpu                  = 256
memory               = 512
desired_count        = 2

min_capacity         = 2
max_capacity         = 6
cpu_target_value     = 60