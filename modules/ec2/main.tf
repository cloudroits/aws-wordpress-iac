resource "aws_instance" "wordpress" {
  ami                         = "ami-0c02fb55956c7d316" # Ubuntu 22.04 LTS Free Tier
  instance_type               = var.instance_type
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io jq awscli
              systemctl start docker
              systemctl enable docker

              # Retrieve DB credentials from Secrets Manager
              DB_SECRET=$(aws secretsmanager get-secret-value --secret-id ${var.db_secret_name} --region ${var.aws_region} --query SecretString --output text)
              DB_USER=$(echo $DB_SECRET | jq -r .username)
              DB_PASSWORD=$(echo $DB_SECRET | jq -r .password)

              docker run -d --name wordpress \
                -e WORDPRESS_DB_HOST=${var.db_endpoint} \
                -e WORDPRESS_DB_USER=$DB_USER \
                -e WORDPRESS_DB_PASSWORD=$DB_PASSWORD \
                -e WORDPRESS_DB_NAME=${var.db_name} \
                -p 80:80 wordpress
              EOF

  tags = {
    Name = "WordPress-EC2"
  }
}

output "ec2_public_ip" {
  value = aws_instance.wordpress.public_ip
}