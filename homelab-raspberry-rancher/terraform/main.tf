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
  ami           = "ami-07ee04759daf109de" // ubuntu 22.04 arm
  instance_type = "t4g.large"
  key_name      = "study"

  vpc_security_group_ids      = ["sg-0897f9f4f1033d53a"]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 64
    volume_type = "gp2"
  }

  tags = {
    Name = "rancher-arm64"
  }
}

resource "aws_instance" "k3s" {
  ami           = "ami-07ee04759daf109de" // ubuntu 22.04 arm
  instance_type = "t4g.large"
  key_name      = "study"

  vpc_security_group_ids      = ["sg-0897f9f4f1033d53a"]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 64
    volume_type = "gp2"
  }

  tags = {
    Name = "k3s1-arm64"
  }
}

resource "local_file" "ansible_inventory" {
  content  = <<-EOT
    [rancher]
    ${aws_instance.rancher.public_ip}

    [k3s]
    ${aws_instance.k3s.public_ip}
  EOT
  filename = "../ansible/inventory.ini"
}
