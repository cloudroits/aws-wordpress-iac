resource "aws_secretsmanager_secret" "db_credentials" {
  name = var.db_secret_name
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id     = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    username = "admin"
    password = "ChangeThisPassword123!"
  })
}

resource "aws_db_instance" "wordpress" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = jsondecode(aws_secretsmanager_secret_version.db_credentials_version.secret_string)["username"]
  password             = jsondecode(aws_secretsmanager_secret_version.db_credentials_version.secret_string)["password"]
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    Name = "WordPress-RDS"
  }
}

output "db_endpoint" {
  value = aws_db_instance.wordpress.endpoint
}

output "db_secret_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}