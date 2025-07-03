
# 📦 AWS WordPress Free Tier DevOps Project Roadmap

This guide provides a **step-by-step implementation roadmap** for deploying WordPress on AWS Free Tier using Terraform, with S3 backend, DynamoDB locking, Secrets Manager, and CI/CD via GitHub Actions. Perfect for practicing **real-world DevOps**.

---

## 🏁 Prerequisites
- AWS Account (Free Tier eligible)
- AWS CLI configured (`aws configure`)
- Terraform installed (>= 1.7)
- Git & GitHub account
- Basic knowledge of AWS services (EC2, RDS, S3)

---

## 🚀 Step 1: Fork and Clone the Repo
```bash
git clone https://github.com/YOUR_USERNAME/aws-wordpress-iac.git
cd aws-wordpress-iac
```

---

## 🌱 Step 2: Create S3 Bucket & DynamoDB Table (Backend)
Manually create backend resources:

### Create S3 Bucket
```bash
aws s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1
aws s3api put-bucket-versioning --bucket my-terraform-state-bucket --versioning-configuration Status=Enabled
```

### Create DynamoDB Table for Locking
```bash
aws dynamodb create-table     --table-name terraform-locks     --attribute-definitions AttributeName=LockID,AttributeType=S     --key-schema AttributeName=LockID,KeyType=HASH     --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

Update `backend.tf` with your bucket and table names.

---

## ⚡ Step 3: Initialize Terraform
```bash
terraform init
```

This pulls remote state configuration and sets up S3 + DynamoDB as backend.

---

## 📝 Step 4: Review and Plan Infrastructure
```bash
terraform plan
```

Review all resources to be created (EC2, RDS, Secrets Manager).

---

## 🚀 Step 5: Apply Terraform
```bash
terraform apply
```

This will:
- Create RDS instance (MySQL)
- Store DB credentials in Secrets Manager
- Launch EC2 instance (WordPress container)
- Configure Docker + retrieve secrets

---

## 🌐 Step 6: Access WordPress
Get the EC2 public IP:
```bash
terraform output ec2_public_ip
```

Visit `http://<EC2_PUBLIC_IP>` in your browser.

---

## 🔄 Step 7: Set Up CI/CD (GitHub Actions)
1. Go to your GitHub repository → Settings → Secrets
2. Add:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
3. Push changes to trigger GitHub Actions:
```bash
git add .
git commit -m "Trigger CI/CD pipeline"
git push
```

Pipeline automatically runs:
- `terraform init`
- `terraform plan`
- (Optional) `terraform apply`

---

## 🏗 Future Enhancements
✅ Add ALB + Route53 for domain
✅ Enable HTTPS with ACM or Let's Encrypt
✅ EFS for wp-content persistence
✅ Multi-environment (dev/stage/prod) with workspaces
✅ Custom VPC with private RDS

---

## 📖 Docs Generated With MkDocs
- Install MkDocs:
  ```bash
  pip install mkdocs
  ```
- Serve locally:
  ```bash
  mkdocs serve
  ```
- Deploy to GitHub Pages:
  ```bash
  mkdocs gh-deploy
  ```

---

## 📦 Repo Structure
```
aws-wordpress-iac/
├── backend.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── ec2/
│   └── rds/
├── .github/workflows/terraform.yml
├── .gitignore
└── README.md
```
