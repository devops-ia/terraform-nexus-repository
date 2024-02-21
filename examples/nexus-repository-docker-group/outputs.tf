################################################################################
# Repository Docker Group
################################################################################
output "name" {
  description = "The name of the resource."
  value       = module.nexus_repository_docker_group.name
}
