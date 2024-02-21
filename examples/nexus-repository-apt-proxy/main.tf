provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Apt Proxy
################################################################################
module "nexus_repository_apt_proxy" {
  source = "../../modules/nexus-repository-apt-proxy"

  name   = "apt-proxy"
  online = true

  routing_rule = "string"
  distribution = "bionic"
  flat         = false

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://remote.repository.com"
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

    connection = {
      retries                   = 0
      user_agent_suffix         = "string"
      timeout                   = 60
      enable_circular_redirects = false
      enable_cookies            = false
      use_trust_store           = false
    }

    authentication = {
      type     = "username"
      username = "admin"
      password = "admin-password"
    }
  }

  cleanup = {
    policy_names = ["policy"]
  }
}
