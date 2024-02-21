################################################################################
# Repository Helm Hosted
################################################################################
output "name" {
  description = "The name of the resource."
  value       = module.nexus_repository_helm_hosted.name
}
