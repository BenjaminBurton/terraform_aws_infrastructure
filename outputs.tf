output "vpc_id" {
  value       = aws_vpc.main_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_1_id" {
  value       = aws_subnet.public_subnet_1.id
  description = "The ID of the first public subnet"
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_subnet_2.id
  description = "The ID of the second public subnet"
}

output "private_subnet_1_id" {
  value       = aws_subnet.private_subnet_1.id
  description = "The ID of the first private subnet"
}

output "private_subnet_2_id" {
  value       = aws_subnet.private_subnet_2.id
  description = "The ID of the second private subnet"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.main_igw.id
  description = "The ID of the Internet Gateway"
}


output "s3_bucket_name" {
  description = "The name of the S3 bucket used for the Terraform backend"
  value       = aws_s3_bucket.terraform_backend.id
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking"
  value       = aws_dynamodb_table.terraform_locks.name
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.terraform_backend.arn
}

output "s3_bucket_versioning" {
  description = "Versioning status of the S3 bucket"
  value       = aws_s3_bucket_versioning.versioning_enabled.versioning_configuration[0].status
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.main_alb.dns_name
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.main_alb.arn
}

output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = aws_lb_target_group.web_target_group.arn
}

output "alb_listener_arn" {
  description = "The ARN of the ALB listener"
  value       = aws_lb_listener.http_listener.arn
}


output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.mysql_db.endpoint
}

output "rds_instance_id" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.mysql_db.id
}

output "rds_db_name" {
  description = "The RDS database name"
  value       = aws_db_instance.mysql_db.db_name
}


output "launch_template_id" {
  description = "The ID of the Launch Template"
  value       = aws_launch_template.web_server_lt.id
}

output "launch_template_latest_version" {
  description = "The latest version of the Launch Template"
  value       = aws_launch_template.web_server_lt.latest_version
}

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.name
}

output "asg_arn" {
  description = "The ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.arn
}

output "scale_up_policy_arn" {
  description = "The ARN of the Auto Scaling Scale-Up Policy"
  value       = aws_autoscaling_policy.scale_up.arn
}

output "scale_down_policy_arn" {
  description = "The ARN of the Auto Scaling Scale-Down Policy"
  value       = aws_autoscaling_policy.scale_down.arn
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table.id
}

output "public_route" {
  description = "The internet gateway route for the public route table"
  value       = aws_route.public_route.destination_cidr_block
}

output "public_route_table_associations" {
  description = "Public subnets associated with the public route table"
  value       = [aws_route_table_association.public_route_association_1.subnet_id, aws_route_table_association.public_route_association_2.subnet_id]
}

output "private_route_table_associations" {
  description = "Private subnets associated with the private route table"
  value       = [aws_route_table_association.private_route_association_1.subnet_id, aws_route_table_association.private_route_association_2.subnet_id]
}

output "web_sg_id" {
  description = "The ID of the security group for web servers"
  value       = aws_security_group.web_sg.id
}

output "web_sg_name" {
  description = "The name of the security group for web servers"
  value       = aws_security_group.web_sg.tags["Name"]
}

output "db_sg_id" {
  description = "The ID of the security group for the database"
  value       = aws_security_group.db_sg.id
}

output "db_sg_name" {
  description = "The name of the security group for the database"
  value       = aws_security_group.db_sg.tags["Name"]
}

output "alb_sg_id" {
  description = "The ID of the security group for the ALB"
  value       = aws_security_group.alb_sg.id
}

output "alb_sg_name" {
  description = "The name of the security group for the ALB"
  value       = aws_security_group.alb_sg.tags["Name"]
}
