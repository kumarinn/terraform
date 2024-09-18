
provider "aws" {
  region = "ap-south-1"
}

resource "aws_eip" "ip" {
  instance = aws_instance.example.id
}

resource "aws_instance" "example" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
}

