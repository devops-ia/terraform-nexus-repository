################################################################################
# Docker Hosted
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_docker_hosted.main.name
}
