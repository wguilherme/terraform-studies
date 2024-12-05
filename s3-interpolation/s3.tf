resource "aws_s3_bucket" "this" {

  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = {
    Service     = "S3"
    Managedby   = "Terraform"
    Environment = var.environment
    Owner       = "Withney Guilherme"
  }
}
