# Variables generales
variable "network_name" {
  description = "Nombre de la red Docker compartida"
  type        = string
  default     = "libreria_network"
}

# Variables para PostgreSQL
variable "postgres_image" {
  description = "Imagen Docker para PostgreSQL"
  type        = string
  default     = "postgres:latest"
}

variable "postgres_container_name" {
  description = "Nombre del contenedor PostgreSQL"
  type        = string
  default     = "db"
}

variable "postgres_ports" {
  description = "Puertos para PostgreSQL (internal, external)"
  type        = map(number)
  default = {
    internal = 5432
    external = 5433
  }
}

variable "postgres_env" {
  description = "Variables de entorno para PostgreSQL"
  type        = map(string)
  sensitive   = true
}

variable "postgres_volume_path" {
  description = "Ruta del volumen para PostgreSQL"
  type        = string
  default     = "./postgres_data"
  sensitive   = true
}

# Variables para Redis
variable "redis_image" {
  description = "Imagen Docker para Redis"
  type        = string
  default     = "redis:latest"
}

variable "redis_container_name" {
  description = "Nombre del contenedor Redis"
  type        = string
  default     = "redis_LIB"
}

variable "redis_ports" {
  description = "Puertos para Redis (internal, external)"
  type        = map(number)
  default = {
    internal = 6379
    external = 8081
  }
}

# Variables para PgAdmin
variable "pgadmin_image" {
  description = "Imagen Docker para PgAdmin"
  type        = string
  default     = "dpage/pgadmin4:latest"
}

variable "pgadmin_container_name" {
  description = "Nombre del contenedor PgAdmin"
  type        = string
  default     = "pgadmin_containerLIB"
}

variable "pgadmin_ports" {
  description = "Puertos para PgAdmin (internal, external)"
  type        = map(number)
  default = {
    internal = 80
    external = 8082
  }
}

variable "pgadmin_env" {
  description = "Variables de entorno para PgAdmin"
  type        = map(string)
  sensitive   = true
  default = {
    PGADMIN_DEFAULT_EMAIL    = "postgres@example.com"
    PGADMIN_DEFAULT_PASSWORD = "Caasd21215@@"
  }
}

variable "pgadmin_volume_path" {
  description = "Ruta del volumen para PgAdmin"
  type        = string
  default     = "./pgadmin_data"
  sensitive   = true
}

# Variables para Django
variable "django_image" {
  description = "Imagen Docker para Django"
  type        = string
  default     = "libreria_local"
}

variable "django_container_name" {
  description = "Nombre del contenedor Django"
  type        = string
  default     = "libreria_container"
}

variable "django_ports" {
  description = "Puertos para Django (internal, external)"
  type        = map(number)
  default = {
    internal = 8080
    external = 8080
  }
}

variable "django_volume_path" {
  description = "Ruta del volumen para Django"
  type        = string
  default     = "./app"
}

variable "django_command" {
  description = "Comando para ejecutar en el contenedor Django"
  type        = list(string)
  default = [
    "sh", "-c",
    "python libreriaR/manage.py makemigrations && python libreriaR/manage.py migrate && python libreriaR/manage.py runserver 0.0.0.0:8080"
  ]
}