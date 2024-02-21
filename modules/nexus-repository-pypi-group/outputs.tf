################################################################################
# Pypi Group
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_pypi_group.main.name
}
