provider "aws" {
  region = "ap-south-1"
}

data "aws_availability_zones" "azlist" {
  state = "available"
}

data "aws_instances" "instance_running" {
  filter {
    name = "instance-type"
    values = ["t2.micro","t2.small"]
  }

  instance_state_names = ["running", "stopped"]
}



