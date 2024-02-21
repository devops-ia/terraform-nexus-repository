################################################################################
# Docker Group
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_docker_group.main.name
}
