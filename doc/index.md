
# 🌐 WordPress AWS DevOps Stack

**Terraform-based Infrastructure as Code with Secrets Manager, S3 Remote Backend, DynamoDB Locking & GitHub Actions CI/CD.**

This project demonstrates a real-world DevOps workflow for deploying WordPress on AWS Free Tier using enterprise-grade practices.

---

## 🚀 Features
- ✅ **Terraform IaC**: Modular and reusable codebase
- ✅ **Secrets Manager**: Securely stores DB credentials
- ✅ **S3 Remote Backend**: Centralized state management with versioning
- ✅ **DynamoDB Locking**: Prevents concurrent Terraform applies
- ✅ **GitHub Actions CI/CD**: Automated infrastructure deployments
- ✅ **Free Tier Compliant**: Designed to run within AWS Free Tier limits

---

## 🏁 Prerequisites
- AWS Account (Free Tier eligible)
- AWS CLI configured (`aws configure`)
- Terraform installed (>= 1.7)
- Git & GitHub account
- MkDocs installed for local docs (`pip install mkdocs`)

---

## 📦 Step-by-Step Roadmap

### 1️⃣ Fork and Clone the Repo
```bash
git clone https://github.com/YOUR_USERNAME/aws-wordpress-iac.git
cd aws-wordpress-iac
```

### 2️⃣ Create S3 Bucket & DynamoDB Table
Manually create backend resources:

#### Create S3 Bucket
```bash
aws s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1
aws s3api put-bucket-versioning --bucket my-terraform-state-bucket --versioning-configuration Status=Enabled
```

#### Create DynamoDB Table for Locking
```bash
aws dynamodb create-table     --table-name terraform-locks     --attribute-definitions AttributeName=LockID,AttributeType=S     --key-schema AttributeName=LockID,KeyType=HASH     --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

Update `backend.tf` with your bucket and table names.

### 3️⃣ Initialize Terraform
```bash
terraform init
```

### 4️⃣ Review and Plan Infrastructure
```bash
terraform plan
```

### 5️⃣ Apply Terraform
```bash
terraform apply
```

This will:
- Provision RDS MySQL
- Store credentials in Secrets Manager
- Launch EC2 (WordPress container)

### 6️⃣ Access WordPress
Get the EC2 public IP:
```bash
terraform output ec2_public_ip
```
Open `http://<EC2_PUBLIC_IP>` in your browser.

### 7️⃣ Set Up CI/CD (GitHub Actions)
1. Add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` as GitHub Secrets
2. Push changes to trigger pipeline

```bash
git add .
git commit -m "Trigger CI/CD pipeline"
git push
```

Pipeline runs:
- `terraform init`
- `terraform plan`
- (Optional) `terraform apply`

---

## 📖 Repo Structure
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
└── README.md
```

---

## 🏗 Future Enhancements
✅ ALB + Route53 for custom domain support  
✅ HTTPS with ACM or Let's Encrypt  
✅ EFS for wp-content persistence  
✅ Multi-environment support (dev/stage/prod) with workspaces  
✅ Custom VPC with private RDS

---

## 📦 Topics
`aws`, `terraform`, `devops`, `iac`, `wordpress`, `rds`, `secrets-manager`, `s3`, `dynamodb`, `github-actions`, `ci-cd`, `infrastructure-as-code`

---

## 📄 License
MIT License © Cloudroits
