provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  key_name      = "Devops_practice"

  provisioner "file" {
    source      = "test.conf"
    destination = "/tmp/myapp.conf"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("DevOps_practice.pem")
    host        = self.public_ip
  }
}
