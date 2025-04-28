# Configuración del proveedor Docker
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Red compartida
resource "docker_network" "libreria_network" {
  name = var.network_name
}

# PostgreSQL
resource "docker_image" "postgres" {
  name = var.postgres_image
}

resource "docker_container" "postgres_containerLIB" {
  name  = var.postgres_container_name
  image = docker_image.postgres.name

  ports {
    internal = var.postgres_ports["internal"]
    external = var.postgres_ports["external"]
  }

  env = [for key, value in var.postgres_env : "${key}=${value}"]

  volumes {
    container_path = "/var/lib/postgresql/data/"
    host_path      = abspath(var.postgres_volume_path)
  }

  networks_advanced {
    name = docker_network.libreria_network.name
  }

}

# Redis
resource "docker_image" "redis" {
  name = var.redis_image
}

resource "docker_container" "redis_LIB" {
  name  = var.redis_container_name
  image = docker_image.redis.name

  ports {
    internal = var.redis_ports["internal"]
    external = var.redis_ports["external"]
  }

  networks_advanced {
    name = docker_network.libreria_network.name
  }

}

# PgAdmin
resource "docker_image" "pgadmin" {
  name = var.pgadmin_image
}

resource "docker_container" "pgadmin_containerLIB" {
  name  = var.pgadmin_container_name
  image = docker_image.pgadmin.name

  ports {
    internal = var.pgadmin_ports["internal"]
    external = var.pgadmin_ports["external"]
  }

  env = [for key, value in var.pgadmin_env : "${key}=${value}"]

  volumes {
    container_path = "/var/lib/pgadmin"
    host_path      = abspath(var.pgadmin_volume_path)
  }

  depends_on = [docker_container.postgres_containerLIB]

  networks_advanced {
    name = docker_network.libreria_network.name
  }

}

# Django
resource "docker_image" "django_app" {
  name = var.django_image

  build {
    context = abspath("${path.module}")
  }
}

resource "docker_container" "django_container" {
  name  = var.django_container_name
  image = docker_image.django_app.name

  command = var.django_command

  ports {
    internal = var.django_ports["internal"]
    external = var.django_ports["external"]
  }

  #volumes {
  # container_path = "/app"
  # host_path      = abspath(var.django_volume_path)
  #}

  depends_on = [
    docker_container.postgres_containerLIB,
    docker_container.redis_LIB
  ]

  networks_advanced {
    name = docker_network.libreria_network.name
  }
}