################################################################################
# Npm Hosted
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_npm_hosted.main.name
}
