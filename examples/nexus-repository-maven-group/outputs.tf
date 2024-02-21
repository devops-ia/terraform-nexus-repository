################################################################################
# Repository Maven Group
################################################################################
output "name" {
  description = "The name of the resource."
  value       = module.nexus_repository_maven_group.name
}
