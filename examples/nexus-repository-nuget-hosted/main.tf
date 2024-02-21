provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Nuget Hosted
################################################################################
module "nexus_repository_nuget_hosted" {
  source = "../../modules/nexus-repository-nuget-hosted"

  name   = "nuget-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
