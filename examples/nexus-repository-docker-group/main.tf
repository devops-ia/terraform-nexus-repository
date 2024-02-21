provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Docker Group
################################################################################
module "nexus_repository_docker_group" {
  source = "../../modules/nexus-repository-docker-group"

  name   = "docker-group"
  online = true

  docker = {
    force_basic_auth = false
    http_port        = 8080
    https_port       = 8433
    v1_enabled       = false
    subdomain        = "docker"
  }

  group = {
    member_names = [
      "member1",
      "member2"
    ]
    writable_member = "member3"
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
