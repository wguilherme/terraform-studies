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
  default     = "ami-0b8c6b923777519db"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.nano"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "instance created by terraform"
    Project = "terraform-study"
  }
}
