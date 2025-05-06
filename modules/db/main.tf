terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}


resource "docker_network" "libreria_network" {
  name = var.network_name
}

resource "docker_container" "postgres_containerLIB" {
  name  = var.postgres_container_name
  image = var.postgres_image
  ports {
    internal = var.postgres_ports["internal"]
    external = var.postgres_ports["external"]
  }
  env = [for k, v in var.postgres_env : "${k} = ${v}"]
  volumes {
    host_path      = var.postgres_volume_path
    container_path = "/var/lib/postgresql/data"
  }
  networks_advanced {
    name = docker_network.libreria_network.name
  }
}

resource "docker_container" "redis_LIB" {
  name  = var.redis_container_name
  image = var.redis_image
  ports {
    internal = var.redis_ports["internal"]
    external = var.redis_ports["external"]
  }
  networks_advanced {
    name = docker_network.libreria_network.name
  }
}

resource "docker_container" "pgadmin_containerLIB" {
  name  = var.pgadmin_container_name
  image = var.pgadmin_image
  ports {
    internal = var.pgadmin_ports["internal"]
    external = var.pgadmin_ports["external"]
  }
  env = [for k, v in var.postgres_env : "${k} = ${v}"]
  volumes {
    host_path      = var.pgadmin_volume_path
    container_path = "/var/lib/pgadmin"
  }
  networks_advanced {
    name = docker_network.libreria_network.name
  }
}
