provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "examplea" {
  ami           = var.amiid
  instance_type = var.type

  #creation time provisioner
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }

  # taint
  provisioner "local-exec" {
    command    = "exit 1"
    on_failure = continue
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm private_ips.txt"
  }
}
