################################################################################
# Maven Proxy
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_maven_proxy.main.name
}
