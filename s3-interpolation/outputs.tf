output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = ""
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = ""
}

output "ips_file_path" {
  value = "${aws_s3_bucket.this.id}/${local.ip_file_path}"
}