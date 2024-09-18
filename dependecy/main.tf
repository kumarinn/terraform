
provider "aws" {
  region = "ap-south-1"
}

#commenting for now used for implicity dependency
# resource "aws_eip" "ip" {
#  instance = aws_instance.example.id
# }

resource "aws_instance" "example" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.example]
}

resource "aws_s3_bucket" "example" {
  bucket = "sept202418kum2"

}

