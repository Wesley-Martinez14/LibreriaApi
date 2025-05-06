output "network_name" {
  value = module.db.network_name
}

output "postgres_credentials" {
  value = {
    host = module.db.postgres_container_name
    port = module.db.postgres_container_port
  }
}

output "service_urls" {
  value = {
    django_app_url = "http://localhost:${module.app.django_container_port}"
    pgadmin_url    = "http://localhost:${module.db.pgadmin_port}"
    redis_url      = "redis://localhost:${module.db.redis_port}"
  }
}
