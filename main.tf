terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

#######################
# NETWORK SHARED
#######################

resource "docker_network" "libreria_network" {
  name = "libreria_network"
}

#######################
# POSTGRES CONTAINER
#######################

resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_container" "postgres_containerLIB" {
  name  = "db"
  image = docker_image.postgres.name

  ports {
    internal = 5432
    external = 5433
  }

  env = [
    "POSTGRES_DB=libreriadb",
    "POSTGRES_USER=postgres",
    "POSTGRES_PASSWORD=Caasd21215@@"
  ]

  volumes {
    container_path = "/var/lib/postgresql/data/"
    host_path      = abspath("${path.module}/postgres_data")
  }

  networks_advanced {
    name = docker_network.libreria_network.name
  }
}

#######################
# REDIS CONTAINER
#######################

resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_container" "redis_LIB" {
  name  = "redis_LIB"
  image = docker_image.redis.name

  ports {
    internal = 6379
    external = 8081
  }

  networks_advanced {
    name = docker_network.libreria_network.name
  }
}

#######################
# PGADMIN CONTAINER
#######################

resource "docker_image" "pgadmin" {
  name = "dpage/pgadmin4:latest"
}

resource "docker_container" "pgadmin_containerLIB" {
  name  = "pgadmin_containerLIB"
  image = docker_image.pgadmin.name

  ports {
    internal = 80
    external = 8082
  }

  env = [
    "PGADMIN_DEFAULT_EMAIL=postgres@example.com",
    "PGADMIN_DEFAULT_PASSWORD=Caasd21215@@"
  ]

  volumes {
    container_path = "/var/lib/pgadmin"
    host_path      = abspath("${path.module}/pgadmin_data")
  }

  depends_on = [docker_container.postgres_containerLIB]

  networks_advanced {
    name = docker_network.libreria_network.name
  }
}

#######################
# DJANGO CONTAINER
#######################

resource "docker_image" "django_app" {
  name = "libreria_local"

  build {
    context = "${path.module}"
  }
}

resource "docker_container" "django_container" {
  name  = "libreria_container"
  image = docker_image.django_app.name

  command = ["sh", "-c", "python libreriaR/manage.py makemigrations && python libreriaR/manage.py migrate && python libreriaR/manage.py runserver 0.0.0.0:8080"]

  ports {
    internal = 8080
    external = 8080
  }

  volumes {
    container_path = "/app"
    host_path      = abspath("${path.module}")
  }

  depends_on = [
    docker_container.postgres_containerLIB,
    docker_container.redis_LIB
  ]

  networks_advanced {
    name = docker_network.libreria_network.name
  }
}
