terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}
provider "docker" {}

module "db" {
  source = "./modules/db"

  network_name           = var.network_name
  postgres_image         = var.postgres_image
  postgres_container_name = var.postgres_container_name
  postgres_ports         = var.postgres_ports
  postgres_env           = var.postgres_env
  postgres_volume_path   = abspath(var.postgres_volume_path)

  redis_image            = var.redis_image
  redis_container_name   = var.redis_container_name
  redis_ports            = var.redis_ports

  pgadmin_image          = var.pgadmin_image
  pgadmin_container_name = var.pgadmin_container_name
  pgadmin_ports          = var.pgadmin_ports
  pgadmin_env            = var.pgadmin_env
  pgadmin_volume_path    = abspath(var.pgadmin_volume_path)
}

module "app" {
  source = "./modules/django_app"

  django_image          = var.django_image
  django_container_name = var.django_container_name
  django_ports          = var.django_ports
  django_command        = var.django_command
  network_name          = var.network_name

  depends_on_postgres = module.db
  depends_on_redis    = module.db
}
