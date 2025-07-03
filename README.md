# =============================================
# 📦 AWS WordPress Free Tier DevOps Project (with S3 + DynamoDB Backend)
# =============================================
# Full Terraform project with CI/CD (GitHub Actions)
# - AWS Free Tier compliant
# - Professional repo structure
# - Secrets Manager for DB credentials
# - S3 Remote Backend with DynamoDB locking (VBST)
# =============================================

This project provisions a WordPress stack on AWS Free Tier using Terraform, stores DB credentials securely in AWS Secrets Manager, and uses S3 + DynamoDB for remote state management.

## 🚀 Quick Start
```bash
git clone https://github.com/YOUR_USERNAME/aws-wordpress-iac.git
cd aws-wordpress-iac
terraform init
terraform plan
terraform apply
```

Visit: http://<EC2_PUBLIC_IP>

## 🔒 Security
✅ DB credentials via Secrets Manager
✅ Terraform state stored remotely in S3 (VBST)
✅ State locking with DynamoDB to prevent conflicts
✅ No local state file committed to Git

## 🔥 Features
✅ Free Tier compliant
✅ Modular Terraform (ec2, rds, secrets)
✅ GitHub Actions CI/CD for team workflows
✅ Remote Backend with S3 + DynamoDB Locking

## 🏗 Future Enhancements
- Add ALB + Route53 for custom domains
- Enable SSL/TLS (Let's Encrypt or ACM)
- EFS for wp-content persistence