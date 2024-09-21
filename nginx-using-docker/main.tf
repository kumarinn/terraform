terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
}
}
}

provider "docker" {}

resource "docker_image" "nginx"  {  #downloads the nginx image from the dockerhub 
  name = "nginx"
  keep_locally = "false"
}


resource "docker_container" "nginx" {
  image = docker_image.image_name  #implicit dependency ( Container depends on the image) Container - Child block, Image: Parent Block
  name = "nginx"
  ports {
    internal = 80   #nginx default port i.e container port
    external = 8000  # host port
}
}

