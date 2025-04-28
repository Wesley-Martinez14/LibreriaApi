# Output para la red compartida
output "network_name" {
  description = "Nombre de la red Docker compartida"
  value       = docker_network.libreria_network.name
}

# Output para las credenciales de PostgreSQL
output "postgres_credentials" {
  description = "Credenciales de PostgreSQL"
  sensitive   = true
  value = {
    username = var.postgres_env["POSTGRES_USER"]
    password = var.postgres_env["POSTGRES_PASSWORD"]
    database = var.postgres_env["POSTGRES_DB"]
    host     = docker_container.postgres_containerLIB.name
    port     = docker_container.postgres_containerLIB.ports[0].external
  }
}

# Output para las URLs de acceso a los servicios
output "service_urls" {
  description = "URLs de acceso a los servicios"
  value = {
    django_app_url = "http://localhost:${docker_container.django_container.ports[0].external}"
    pgadmin_url    = "http://localhost:${docker_container.pgadmin_containerLIB.ports[0].external}"
    redis_url      = "redis://localhost:${docker_container.redis_LIB.ports[0].external}"
  }
}