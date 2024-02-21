################################################################################
# Docker Proxy
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_docker_proxy.main.name
}
