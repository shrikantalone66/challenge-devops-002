terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_net" {
  name = "assignment-net"
}

resource "docker_image" "web" {
  name = "nginx:latest"
}

resource "docker_container" "web" {
  name  = "web"
  image = docker_image.web.image_id
  networks_advanced {
    name = docker_network.app_net.name
  }
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "app" {
  name = "traefik/whoami:latest"
}

resource "docker_container" "app" {
  name  = "app"
  image = docker_image.app.image_id
  env = [
    "UPSTREAM_HOST=172.17.0.2"
  ]
  networks_advanced {
    name = docker_network.app_net.name
  }
  ports {
    internal = 80
    external = 8080
  }
}

resource "null_resource" "deploy_manifest" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "echo 'deployed at ${timestamp()}' > deploy-manifest.txt"
  }
}
