variable "django_image" {
  description = "Nombre o ruta de la imagen de la app Django"
  type        = string
}

variable "django_container_name" {
  description = "Nombre del contenedor Django"
  type        = string
}

variable "django_ports" {
  description = "Puertos del contenedor Django (internal/external)"
  type        = map(number)
}

variable "django_command" {
  description = "Comando para ejecutar en el contenedor Django"
  type        = list(string)
}

variable "network_name" {
  description = "Nombre de la red compartida para comunicación entre servicios"
  type        = string
}

variable "depends_on_postgres" {
  description = "Dependencia del contenedor PostgreSQL (puede ser cualquier valor para forzar el orden)"
  type        = any
}

variable "depends_on_redis" {
  description = "Dependencia del contenedor Redis"
  type        = any
}
