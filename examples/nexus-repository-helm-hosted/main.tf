provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Helm Hosted
################################################################################
module "nexus_repository_helm_hosted" {
  source = "../../modules/nexus-repository-helm-hosted"

  name   = "helm-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }
}
