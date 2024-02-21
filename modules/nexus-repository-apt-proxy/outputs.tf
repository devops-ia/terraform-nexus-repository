################################################################################
# Apt Proxy
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_apt_proxy.main.name
}
