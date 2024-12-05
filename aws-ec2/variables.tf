variable "environment" {
  type        = string
  description = "Variável que vai ser definida pelo arquivo <*>.tfvars"
}

variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "terraform-study-wg-dev"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-005fc0f236362e99f" // ubuntu 22.04
}

variable "instance_type" {
  type        = string
  description = "Nome da instância do EC2, utilize e nomenclatura AMI da AWS"
  default     = "t2.nano"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "instance-001"
    Project = "terraform-study"
  }
}
