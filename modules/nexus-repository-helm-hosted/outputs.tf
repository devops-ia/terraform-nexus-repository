################################################################################
# Helm Hosted
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_helm_hosted.main.name
}
