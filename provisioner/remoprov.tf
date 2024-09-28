provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example1" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  key_name      = "DevOps_practice"

  provisioner "local-exec" {
    command = "echo 'while true; do echo hi-students; sleep 5; done' > myscript.sh"
  }

  provisioner "file" {
    source      = "myscript.sh"
    destination = "/tmp/myscript.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/myscript.sh",
      "nohup /tmp/myscript.sh 2>&1 &",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("DevOps_practice.pem")
    host        = self.public_ip
  }
}
