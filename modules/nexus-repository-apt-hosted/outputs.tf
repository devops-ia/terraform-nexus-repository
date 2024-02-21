################################################################################
# Apt Hosted
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_apt_hosted.main.name
}
