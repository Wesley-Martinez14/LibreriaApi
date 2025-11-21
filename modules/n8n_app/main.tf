terraform {
  required_providers {
    # 1. Necesario para crear el contenedor Docker
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_container" "n8n_containerLIB" {
  name  = var.n8n_container_name
  image = var.n8n_image
  
  ports {
    internal = var.n8n_ports["internal"] # Típicamente 5678
    external = var.n8n_ports["external"] # Puerto expuesto al host
  }
  
  # Variables de Entorno (CRUCIALES para Basic Auth y Webhooks)
  env = [
    # Configuración de red y Webhooks
    "N8N_HOST=localhost", 
    "WEBHOOK_URL=http://localhost:${var.n8n_ports["external"]}/", 
    
    # Configuración de la Autenticación Básica (Basic Auth)
    "N8N_BASIC_AUTH_ACTIVE=true", 
    "N8N_BASIC_AUTH_USER=${var.n8n_auth_user}", 
    "N8N_BASIC_AUTH_PASSWORD=${var.n8n_auth_password}"
  ]

  # Conexión a la red Docker compartida
  networks_advanced {
    name = var.network_name
  }

  provisioner "local-exec" {
    command = "sleep 20" 
  }
}

