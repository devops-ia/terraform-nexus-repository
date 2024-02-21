provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Gitlfs Hosted
################################################################################
module "nexus_repository_gitlfs_hosted" {
  source = "../../modules/nexus-repository-gitlfs-hosted"

  name   = "gitlfs-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }
}
