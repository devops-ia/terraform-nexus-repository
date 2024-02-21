provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Yum Hosted
################################################################################
module "nexus_repository_yum_hosted" {
  source = "../../modules/nexus-repository-yum-hosted"

  deploy_policy  = "STRICT"
  name           = "yummy1"
  online         = true
  repodata_depth = 4

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }

  cleanup = {
    policy_names = ["policy"]
  }
}
