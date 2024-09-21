provider "aws" {
  region = "ap-south-1"
}

variable "amid" {
  default = "ami-0522ab6e1ddcc7055"
}

variable "type" {
  default = "t2.micro"
}

resource "aws_instance" "example1" {
  ami  = var.amid
  instance_type = var.type
}
