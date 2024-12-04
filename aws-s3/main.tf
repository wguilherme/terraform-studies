terraform {
  required_version = "1.9.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "us-east-1"
  profile = "terraform-study-wg-dev"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#private-bucket-w-tags
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "wguilherme.dev.terraform.study.bucket-000000001"

  tags = {
    Name        = "Bucket created by Terraform"
    NewTag      = "test"
    Environment = "dev"
    Managedby   = "terraform"
  }
}
