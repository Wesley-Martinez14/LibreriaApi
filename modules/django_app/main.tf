terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "django_app" {
  name = var.django_image

  build {
    context    = abspath("${path.module}/../../")
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "django_container" {
  name  = var.django_container_name
  image = docker_image.django_app.name
  ports {
    internal = var.django_ports["internal"]
    external = var.django_ports["external"]
  }
  command = var.django_command
  networks_advanced {
    name = var.network_name
  }
}
