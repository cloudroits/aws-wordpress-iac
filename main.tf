# ---------------------------
# main.tf
# ---------------------------
module "rds" {
  source         = "./modules/rds"
  db_name        = var.db_name
  db_secret_name = var.db_secret_name
}

module "ec2" {
  source          = "./modules/ec2"
  instance_type   = var.instance_type
  db_endpoint     = module.rds.db_endpoint
  db_secret_name  = var.db_secret_name
}