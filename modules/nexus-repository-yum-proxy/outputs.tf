################################################################################
# Yum Proxy
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_yum_proxy.main.name
}
