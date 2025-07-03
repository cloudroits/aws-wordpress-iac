# ---------------------------
# outputs.tf
# ---------------------------
output "ec2_public_ip" {
  description = "Public IP of WordPress EC2 instance"
  value       = module.ec2.ec2_public_ip
}

output "rds_endpoint" {
  description = "Endpoint of RDS MySQL database"
  value       = module.rds.db_endpoint
}

output "db_secret_arn" {
  description = "ARN of the Secrets Manager secret"
  value       = module.rds.db_secret_arn
}
