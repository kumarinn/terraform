provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket-statefile" {
  bucket = "demostatebucket"
}

resource "aws_dynamodb_table" "dbtable" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Dynamo DB for Terraform state lock"

  }
}

