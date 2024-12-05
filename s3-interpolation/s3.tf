resource "aws_s3_bucket" "this" {

  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags
}

resource "aws_s3_object" "this" {

  bucket = aws_s3_bucket.this.id

  key = "config/${local.ip_file_path}"

  source = local.ip_file_path

  etag = filemd5(local.ip_file_path)
}
