################################################################################
# Yum Group
################################################################################
resource "nexus_repository_yum_group" "main" {
  name   = var.name
  online = var.online

  #dynamic "yum_signing" {
  #  for_each = var.yum_signing != null ? [var.yum_signing] : []
  #
  #  content {
  #    keypair    = var.signing.keypair
  #    passphrase = var.signing.passphrase
  #  }
  #}

  group {
    member_names = var.group.member_names
  }

  storage {
    blob_store_name                = var.storage.blob_store_name
    strict_content_type_validation = var.storage.strict_content_type_validation
  }
}
