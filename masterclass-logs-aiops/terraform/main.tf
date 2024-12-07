terraform {
  required_version = "1.9.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform-study-wg-dev"
}

resource "aws_instance" "rancher" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t3.large"
  key_name      = "study"

  vpc_security_group_ids      = ["sg-0897f9f4f1033d53a"]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  tags = {
    Name = "rancher"
  }
}

resource "aws_instance" "kubernetes" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t3.xlarge"
  key_name      = "study"

  vpc_security_group_ids      = ["sg-0897f9f4f1033d53a"]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  tags = {
    Name = "kubernetes"
  }
}

resource "aws_instance" "ollama" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "c5.2xlarge"
  key_name      = "study"

  vpc_security_group_ids      = ["sg-0897f9f4f1033d53a"]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 200
    volume_type = "gp2"
  }

  tags = {
    Name = "ollama"
  }
}

resource "local_file" "ansible_inventory" {
  content  = <<-EOT
    [rancher]
    ${aws_instance.rancher.public_ip}

    [kubernetes]
    ${aws_instance.kubernetes.public_ip}

    [ollama]
    ${aws_instance.ollama.public_ip}
  EOT
  filename = "../ansible/inventory.ini"
}
