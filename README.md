This repository provisions an infrastructure skeleton for a stateless HTTP service on AWS using Terraform.
The architecture is:
- Internet
    - Application Load Balancer (Multi-AZ, Public Subnets)
    - ECS Fargate Service (Multi-AZ, Private Subnets)
    - CloudWatch Logs
 
- Terraform Remote State
    - S3 (Versioned + Encrypted)
    - DynamoDB (State Locking)  

  Target was to configure the architecture so that services become:
    - Stateless
    - Highly Available
    - Observable
    - Secure
    - Production Safe
 
  Architecture Overview
      - Compute: ECS Fargate
      - Load Balancing: Application Load Balancer
      - Networking:Custom VPC with public & private subnets
      - Outbound Access: NAT Gateway
      - Observability: CloudWatch Logs + ALB Health Checks
      - Auto Scaling: CPU-based target tracking
      - Remote State: S3 + DynamoDB Lock

   Folder Structure:

  
  <img width="189" height="183" alt="image" src="https://github.com/user-attachments/assets/d816f582-d00e-4bdc-897a-b6ca1cd50a18" />
    

  ## What Gets Created

  ### Networking
- VPC
- 2 Public Subnets (ALB)
- 2 Private Subnets (ECS)
- Internet Gateway
- NAT Gateway
- Route Tables

### Security
- ALB Security Group
- ECS Security Group

### Load Balancer
- Application Load Balancer
- Target Group
- Listener
- Health Checks

### Compute
- ECS Cluster
- ECS Task Definition
- ECS Service (min 2 tasks)
- CloudWatch Log Group

### Autoscaling
- Min Capacity: 2
- Max Capacity: Configurable
- CPU Target Tracking Policy

### State Management
- Versioned & Encrypted S3 Bucket
- DynamoDB State Locking

This project demonstrates:

- Infrastructure modularization
- Separation of concerns
- High availability design
- Secure networking patterns
- Terraform best practices
- Production-safe defaults
- Remote state management

### How to run the command:

# bootstrap backend
- cd terraform/bootstrap
- terraform init
- terraform apply

  - [Note] 
  - Run bootstrap once per account.

# deploy infrastructure
- cd ../config/
- terraform init
- terraform plan
- terraform apply


  ### AI Usage Disclosure
  chatgpt is used
    - for understanding the task
    - editing the readme.md file
    - idea generating regarding necessary modules



