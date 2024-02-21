################################################################################
# Helm Proxy
################################################################################
resource "nexus_repository_helm_proxy" "main" {
  name         = var.name
  online       = var.online
  routing_rule = var.routing_rule

  storage {
    blob_store_name                = var.storage.blob_store_name
    strict_content_type_validation = var.storage.strict_content_type_validation
  }

  proxy {
    remote_url       = var.proxy.remote_url
    content_max_age  = var.proxy.content_max_age
    metadata_max_age = var.proxy.metadata_max_age
  }

  dynamic "negative_cache" {
    for_each = var.negative_cache != null ? [var.negative_cache] : []

    content {
      enabled = var.negative_cache.enabled
      ttl     = var.negative_cache.ttl
    }
  }

  http_client {
    blocked    = var.http_client.blocked
    auto_block = var.http_client.auto_block

    dynamic "connection" {
      for_each = var.http_client.connection != null ? [var.http_client.connection] : []

      content {
        retries                   = var.http_client.connection.retries
        user_agent_suffix         = var.http_client.connection.user_agent_suffix
        timeout                   = var.http_client.connection.timeout
        enable_circular_redirects = var.http_client.connection.enable_circular_redirects
        enable_cookies            = var.http_client.connection.enable_cookies
        use_trust_store           = var.http_client.connection.use_trust_store
      }
    }

    dynamic "authentication" {
      for_each = var.http_client.authentication != null ? [var.http_client.authentication] : []

      content {
        type        = var.http_client.authentication.type
        username    = var.http_client.authentication.username
        password    = var.http_client.authentication.password
        ntlm_host   = var.http_client.authentication.ntlm_host
        ntlm_domain = var.http_client.authentication.ntlm_domain
        preemptive  = var.http_client.authentication.preemptive
      }
    }
  }

  dynamic "cleanup" {
    for_each = var.cleanup != null ? [var.cleanup] : []

    content {
      policy_names = var.cleanup.policy_names
    }
  }
}
