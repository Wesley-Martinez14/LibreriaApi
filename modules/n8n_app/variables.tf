
variable "network_name" {
  description = "Nombre de la red Docker compartida"
  type        = string
}

variable "n8n_image" {
  description = "Imagen Docker para n8n"
  type        = string
}

variable "n8n_container_name" {
  description = "Nombre del contenedor n8n"
  type        = string
}

variable "n8n_ports" {
  description = "Puertos para n8n (internal, external)"
  type        = map(number)
}

variable "n8n_auth_user" {
  description = "Usuario de autenticación básica de n8n (N8N_BASIC_AUTH_USER)"
  type        = string
  sensitive   = true
}

variable "n8n_auth_password" {
  description = "Contraseña de autenticación básica de n8n (N8N_BASIC_AUTH_PASSWORD)"
  type        = string
  sensitive   = true
}
