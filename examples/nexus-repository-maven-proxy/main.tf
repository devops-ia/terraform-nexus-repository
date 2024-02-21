provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Maven Proxy
################################################################################
module "nexus_repository_maven_proxy" {
  source = "../../modules/nexus-repository-maven-proxy"

  name   = "maven-central-repo1"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://repo1.maven.org/maven2/"
    content_max_age  = 1440
    metadata_max_age = 1440
  }

  negative_cache = {
    enabled = true
    ttl     = 1440
  }

  http_client = {
    blocked    = false
    auto_block = true
  }

  maven = {
    version_policy = "RELEASE"
    layout_policy  = "PERMISSIVE"
  }
}
