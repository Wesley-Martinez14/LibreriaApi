variable "network_name" {
  description = "Nombre de la red Docker compartida"
  type        = string
}

variable "postgres_image" {
  description = "Imagen Docker para PostgreSQL"
  type        = string
}

variable "postgres_container_name" {
  description = "Nombre del contenedor PostgreSQL"
  type        = string
}

variable "postgres_ports" {
  description = "Puertos para PostgreSQL (internal, external)"
  type        = map(number)
}

variable "postgres_env" {
  description = "Variables de entorno para PostgreSQL"
  type        = map(string)
}

variable "postgres_volume_path" {
  description = "Ruta del volumen para PostgreSQL"
  type        = string
}

variable "redis_image" {
  description = "Imagen Docker para Redis"
  type        = string
}

variable "redis_container_name" {
  description = "Nombre del contenedor Redis"
  type        = string
}

variable "redis_ports" {
  description = "Puertos para Redis (internal, external)"
  type        = map(number)
}

variable "pgadmin_image" {
  description = "Imagen Docker para PgAdmin"
  type        = string
}

variable "pgadmin_container_name" {
  description = "Nombre del contenedor PgAdmin"
  type        = string
}

variable "pgadmin_ports" {
  description = "Puertos para PgAdmin (internal, external)"
  type        = map(number)
}

variable "pgadmin_env" {
  description = "Variables de entorno para PgAdmin"
  type        = map(string)
}

variable "pgadmin_volume_path" {
  description = "Ruta del volumen para PgAdmin"
  type        = string
}
