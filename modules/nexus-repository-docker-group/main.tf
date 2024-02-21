################################################################################
# Docker Group
################################################################################
resource "nexus_repository_docker_group" "main" {
  name   = var.name
  online = var.online

  docker {
    force_basic_auth = var.docker.force_basic_auth
    http_port        = var.docker.http_port
    https_port       = var.docker.https_port
    v1_enabled       = var.docker.v1_enabled
    subdomain        = var.docker.subdomain
  }

  group {
    member_names    = var.group.member_names
    writable_member = var.group.writable_member
  }

  storage {
    blob_store_name                = var.storage.blob_store_name
    strict_content_type_validation = var.storage.strict_content_type_validation
  }
}
