# Terraform AWS Infrastructure

## Overview

This Terraform project sets up a highly available AWS infrastructure, including an S3 backend for state management, a VPC with public and private subnets, an Application Load Balancer, Auto Scaling for web servers, an RDS MySQL database, and security groups for controlled access.

## Features

- **Terraform Backend**: S3 bucket with versioning and encryption for state management.
- **State Locking**: DynamoDB table for locking Terraform state.
- **VPC & Subnets**:
  - Public subnets for web servers.
  - Private subnets for RDS database.
- **Security Groups**:
  - Web servers (HTTP, SSH access restricted).
  - Database (MySQL access from web servers only).
  - ALB (HTTP traffic allowed).
- **Application Load Balancer**: Routes traffic to Auto Scaling web servers.
- **Auto Scaling Group**: Manages EC2 instances for web servers.
- **RDS MySQL Database**: Deployed in private subnets for security.
- **IAM Role & Policy**: Automatically created for Terraform setup to ensure proper permissions before infrastructure deployment.

## Prerequisites

- Terraform installed (`>= 1.0`)
- AWS CLI configured
- IAM user with necessary permissions

## Usage

### Initialize Terraform

```sh
terraform init
```

### Plan the Deployment

```sh
terraform plan
```

### Apply Changes

```sh
terraform apply -auto-approve
```

### Destroy the Infrastructure

```sh
terraform destroy -auto-approve
```

## Configuration

Modify `main.tf` to change:

- AWS region
- VPC and subnet CIDR blocks
- Instance types and AMI IDs
- Auto Scaling parameters
- IAM role and policy settings

## Security Considerations

- Restrict SSH access to known IPs.
- Enable encryption for S3 and RDS.
- Use secure credentials for RDS database.
- Apply least privilege principle to IAM roles.

## Next Steps

- Add monitoring with CloudWatch.
- Implement HTTPS with ACM and ALB.
- Configure CloudFront for content delivery.
- Automate Terraform execution with GitHub Actions.

## Author

[Benjamin Burton](https://github.com/BenjaminBurton)
