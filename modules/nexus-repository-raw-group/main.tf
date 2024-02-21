################################################################################
# Raw Group
################################################################################
resource "nexus_repository_r_group" "main" {
  name   = var.name
  online = var.online

  group {
    member_names = var.group.member_names
  }

  storage {
    blob_store_name                = var.storage.blob_store_name
    strict_content_type_validation = var.storage.strict_content_type_validation
  }
}
