


resource "local_file" "terra_local" {
  filename = "C:/Users/chavh/Desktop/demo.txt"
  content  = " This file is created by terraform"
}
provider "docker" {

}
resource "docker_image" "ngnix-img" {
  name         = "ngnix:latest"
  keep_locally = false

}
resource "docker_container" "ngnix-ctr" {
  name  = " my-ngnix-container"
  image = docker_image.ngnix-img.name

  ports {
    internal = 80
    external = 80
  }
}
##############################################
#running code 
provider "docker" {}

resource "docker_image" "nginx_img" {

  name         = "nginx:latest"
  keep_locally = false

}

resource "docker_container" "nginx" {

  image = docker_image.nginx_img.name
  name  = "nginx-tf"
  ports {

    internal = 80
    external = 80
  }
}

