output "web_container_id" {
  value = docker_container.web.id
}

output "db_password" {
  value = var.db_password
}
