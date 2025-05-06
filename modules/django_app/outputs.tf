output "django_container_port" {
  value = docker_container.django_container.ports[0].external
}
