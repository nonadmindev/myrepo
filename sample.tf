terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_instance" "app_seraver" {
  associate_public_ip_address = true
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  monitoring = true
  vpc_security_group_ids= "group"

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
