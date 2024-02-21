################################################################################
# Nuget Group
################################################################################
output "name" {
  description = "The name of the resource."
  value       = nexus_repository_nuget_group.main.name
}
