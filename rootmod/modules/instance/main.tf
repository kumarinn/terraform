
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "instance1" {
#  ami = "ami-0522ab6e1ddcc7055"
 # instance_tye = "t2.micro"
  ami = var.amid
  instance_type = var.type
}
