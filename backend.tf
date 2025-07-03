# ---------------------------
# backend.tf
# ---------------------------
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"     # Replace with your bucket name
    key            = "wordpress/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
