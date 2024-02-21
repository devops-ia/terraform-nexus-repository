################################################################################
# Maven Hosted
################################################################################
resource "nexus_repository_maven_hosted" "main" {
  name   = var.name
  online = var.online

  storage {
    blob_store_name                = var.storage.blob_store_name
    strict_content_type_validation = var.storage.strict_content_type_validation
    write_policy                   = var.storage.write_policy
  }

  maven {
    version_policy      = var.maven.version_policy
    layout_policy       = var.maven.layout_policy
    content_disposition = var.maven.content_disposition
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
