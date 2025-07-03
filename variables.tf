# ---------------------------
# variables.tf
# ---------------------------
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  default     = "default"
}

variable "db_name" {
  description = "RDS MySQL database name"
  default     = "wordpress_db"
}

variable "db_secret_name" {
  description = "Name of the AWS Secrets Manager secret"
  default     = "wordpress-db-credentials"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}