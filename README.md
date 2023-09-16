# AWS Infrastructure as Code (IaC) with Terraform

### This repository contains Terraform configurations to set up an AWS infrastructure with the following components:
```
Virtual Private Cloud (VPC)
Public and Private Subnets
Internet Gateway (IGW)
Route Tables
Security Groups
EC2 Instances with Nginx Servers
Application Load Balancer (ALB)
Auto Scaling Group (ASG)
```
## Getting Started
Follow the steps below to deploy this infrastructure using Terraform.
Prerequisites
```
Terraform: Make sure to have Terraform installed.

AWS Credentials: Ensure that you have your AWS credentials properly configured on your local machine.

Backend Configuration: Update the backend.tf file with your own S3 bucket and DynamoDB table names for remote state storage.
```
## Configuration

The Terraform configuration for this project is organized into multiple .tf files. The variables.tf file contains variables that can be customized. You can either update these variables directly or create a terraform.tfvars file to override them.

### Initialization

Initialize Terraform in the project directory:
```
terraform init
```
### Deployment

To create the infrastructure, run the following command:
```
terraform apply
```

Terraform will show you a plan of what it's going to create. If everything looks correct, type yes to proceed with the deployment.

Alternatively, the command below can be used for further automation.

```
terraform apply -auto-approve
```

Cleanup

To destroy the infrastructure when done, run:
```
terraform destroy
```

## Infrastructure Overview
VPC Setup

    The VPC is created in the selected region and spans across 3 Availability Zones (AZs).
    There is a public subnet and a private subnet in each AZ.
    An Internet Gateway (IGW) is attached to the VPC.
    Route tables are configured to handle local traffic and route traffic to the IGW for external access.

Security Groups

    Security groups are created for subnets to allow ingress and egress for HTTP (port 80) and HTTPS (port 443) requests from all external sources.

EC2 Instances with Nginx

    EC2 instances are launched in the private subnets.
    Nginx servers are set up on each EC2 instance.

Application Load Balancer (ALB)

    An ALB is created to distribute incoming traffic between the Nginx servers.

Auto Scaling Group (ASG)

    The Auto Scaling Group is configured to use a launch template.
    It maintains a minimum of 3 instances running, one in each AZ.
    If an EC2 instance is terminated manually, the ASG automatically replaces it to ensure there are always 3 servers live.
