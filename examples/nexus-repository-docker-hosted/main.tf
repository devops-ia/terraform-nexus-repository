provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Docker Hosted
################################################################################
module "nexus_repository_docker_hosted" {
  source = "../../modules/nexus-repository-docker-hosted"

  name   = "docker-hosted"
  online = true

  docker = {
    force_basic_auth = false
    v1_enabled       = false
    subdomain        = "docker" # Pro-only
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
