output "n8n_port" {
  description = "Puerto externo expuesto para acceder a la interfaz de n8n."
  # Accede al primer elemento de la lista 'ports' del contenedor Docker
  value       = docker_container.n8n_containerLIB.ports[0].external
}

output "n8n_container_name" {
  description = "Nombre asignado al contenedor n8n."
  value       = docker_container.n8n_containerLIB.name
}