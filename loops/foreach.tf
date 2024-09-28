variable "user_names_new" {
  description = " Create IAM users with the list"
  type        = list(string)
  default     = ["Kumari1", "Kumari2"]
}

resource "aws_iam_user" "iamuser1" {
  for_each = toset(var.user_names_new)
  name     = each.value
}

