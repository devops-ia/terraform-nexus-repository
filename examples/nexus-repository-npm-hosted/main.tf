provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Npm Hosted
################################################################################
module "nexus_repository_npm_hosted" {
  source = "../../modules/nexus-repository-npm-hosted"

  name   = "npm-hosted"
  online = true

  cleanup = {
    policy_names = ["policy"]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
