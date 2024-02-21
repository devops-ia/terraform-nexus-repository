provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Nuget Proxy
################################################################################
module "nexus_repository_nuget_proxy" {
  source = "../../modules/nexus-repository-nuget-proxy"

  name   = "nuget-proxy"
  online = true

  nuget_version            = "V3"
  query_cache_item_max_age = 3600

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://api.nuget.org/v3/index.json"
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
}
