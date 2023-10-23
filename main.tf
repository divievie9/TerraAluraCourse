terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {

  region  = "us-west-2"
}

resource "aws_security_group" "default" {
  
}
resource "aws_instance" "app_server" {
  ami  = "ami-0fcf52bcf5db7b003"
  instance_type = "t2.micro"
  key_name = "ServerAccess"
  user_data_replace_on_change = true
 

  tags = {
    Name = "TesteNovaChave"
  }

  vpc_security_group_ids = [aws_security_group.default.id]
}
