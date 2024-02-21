################################################################################
# Apt Hosted
################################################################################
resource "nexus_repository_apt_hosted" "main" {
  name         = var.name
  online       = var.online
  distribution = var.distribution

  signing {
    keypair    = var.signing.keypair
    passphrase = var.signing.passphrase
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
