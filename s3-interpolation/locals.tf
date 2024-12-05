locals {

  ip_file_path = "ips.json"

  common_tags = {
    Service     = "S3"
    Managedby   = "Terraform"
    Environment = var.environment
    Owner       = "Withney Guilherme"
  }

}
