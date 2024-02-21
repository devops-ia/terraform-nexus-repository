################################################################################
# Docker Hosted
################################################################################
resource "nexus_repository_docker_hosted" "main" {
  name   = var.name
  online = var.online

  docker {
    force_basic_auth = var.docker.force_basic_auth
    http_port        = var.docker.http_port
    https_port       = var.docker.https_port
    v1_enabled       = var.docker.v1_enabled
    subdomain        = var.docker.subdomain
  }

  storage {
    blob_store_name                = var.storage.blob_store_name
    strict_content_type_validation = var.storage.strict_content_type_validation
    write_policy                   = var.storage.write_policy
  }

  dynamic "cleanup" {
    for_each = var.cleanup != null ? [var.cleanup] : []

    content {
      policy_names = var.cleanup.policy_names
    }
  }

  dynamic "component" {
    for_each = var.component != null ? [var.component] : []

    content {
      proprietary_components = var.component.proprietary_components
    }
  }
}
