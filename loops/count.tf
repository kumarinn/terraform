provider "aws" {
  region = "ap-south-1"
}

variable "user_names" {
  type    = list(string)
  default = ["kum1", "kum2", "kum3"]
}

resource "aws_iam_user" "iamuser" {
  count = length(var.user_names)
  name  = var.user_names[count.index]

}

