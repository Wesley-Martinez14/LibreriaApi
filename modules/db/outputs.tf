output "postgres_container_name" {
  value = docker_container.postgres_containerLIB.name
}

output "postgres_container_port" {
  value = docker_container.postgres_containerLIB.ports[0].external
}

output "pgadmin_port" {
  value = docker_container.pgadmin_containerLIB.ports[0].external
}

output "redis_port" {
  value = docker_container.redis_LIB.ports[0].external
}

output "network_name" {
  value = docker_network.libreria_network.name
}
