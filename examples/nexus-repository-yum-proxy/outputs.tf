################################################################################
# Repository Yum Proxy
################################################################################
output "name" {
  description = "The name of the resource."
  value       = module.nexus_repository_yum_proxy.name
}
