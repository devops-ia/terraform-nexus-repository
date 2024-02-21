################################################################################
# Repository Apt Hosted
################################################################################
variable "nexus_repository_apt_hosted" {
  description = "Repository Apt Hosted."
  type = list(object({
    name         = string
    online       = optional(bool)
    distribution = string
    signing = object({
      keypair    = string
      passphrase = optional(string)
    })
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = bool
      write_policy                   = optional(string)
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Apt Proxy
################################################################################
variable "nexus_repository_apt_proxy" {
  description = "Repository Apt Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    distribution = string
    flat         = bool
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    })
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Bower Group
################################################################################
variable "nexus_repository_bower_group" {
  description = "Repository Bower Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Bower Hosted
################################################################################
variable "nexus_repository_bower_hosted" {
  description = "Repository Bower Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = bool
      write_policy                   = optional(string)
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Bower Proxy
################################################################################
variable "nexus_repository_bower_proxy" {
  description = "Repository Bower Proxy."
  type = list(object({
    name                 = string
    online               = optional(bool)
    rewrite_package_urls = bool
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    })
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Cocoapods Proxy
################################################################################
variable "nexus_repository_cocoapods_proxy" {
  description = "Repository Cocoapods Proxy."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    })
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Conan Proxy
################################################################################
variable "nexus_repository_conan_proxy" {
  description = "value"
  type = list(object({
    name   = string
    online = optional(bool)
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    })
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Conda Proxy
################################################################################
variable "nexus_repository_conda_proxy" {
  description = "Repository Conda Proxy."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    })
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Docker Group
################################################################################
variable "nexus_repository_docker_group" {
  description = "Repository Docker Group."
  type = list(object({
    name   = string
    online = optional(bool)
    docker = object({
      force_basic_auth = bool
      http_port        = optional(number)
      https_port       = optional(number)
      v1_enabled       = bool
      subdomain        = optional(string)
    })
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Docker Hosted
################################################################################
variable "nexus_repository_docker_hosted" {
  description = "Repository Docker Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    docker = object({
      force_basic_auth = bool
      http_port        = optional(number)
      https_port       = optional(number)
      v1_enabled       = bool
      subdomain        = optional(string)
    })
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = bool
      write_policy                   = optional(string)
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Docker Proxy
################################################################################
variable "nexus_repository_docker_proxy" {
  description = "Repository Docker Proxy."
  type = list(object({
    name   = string
    online = optional(bool)
    docker = object({
      force_basic_auth = bool
      http_port        = optional(number)
      https_port       = optional(number)
      v1_enabled       = bool
      subdomain        = optional(string)
    })
    docker_proxy = object({
      index_type = string
      index_url  = optional(string)
    })
    storage = object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    })
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Gitlfs Hosted
################################################################################
variable "nexus_repository_gitlfs_hosted" {
  description = "Repository Gitlfs Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}


################################################################################
# Repository Go Group
################################################################################
variable "nexus_repository_go_group" {
  description = "Repository Go Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = optional(set(string))
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Go Proxy
################################################################################
variable "nexus_repository_go_proxy" {
  description = "Repository Go Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Helm Hosted
################################################################################
variable "nexus_repository_helm_hosted" {
  description = "Repository Helm Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Helm Proxy
################################################################################
variable "nexus_repository_helm_proxy" {
  description = "Repository Helm Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Maven Group
################################################################################
variable "nexus_repository_maven_group" {
  description = "Repository Maven Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Maven Hosted
################################################################################
variable "nexus_repository_maven_hosted" {
  description = "Repository Maven Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    maven = object({
      version_policy      = string
      layout_policy       = string
      content_disposition = optional(string)
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Maven Proxy
################################################################################
variable "nexus_repository_maven_proxy" {
  description = "Repository Maven Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    maven = object({
      version_policy      = string
      layout_policy       = string
      content_disposition = optional(string)
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Npm Group
################################################################################
variable "nexus_repository_npm_group" {
  description = "Repository Npm Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Npm Hosted
################################################################################
variable "nexus_repository_npm_hosted" {
  description = "Repository Npm Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}











################################################################################
# Repository Npm Proxy
################################################################################
variable "nexus_repository_npm_proxy" {
  description = "Repository Npm Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    remove_non_cataloged = optional(bool)
    remove_quarantined   = optional(bool)
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Nuget Group
################################################################################
variable "nexus_repository_nuget_group" {
  description = "Repository Nuget Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Nuget Hosted
################################################################################
variable "nexus_repository_nuget_hosted" {
  description = "Repository Nuget Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Nuget Proxy
################################################################################
variable "nexus_repository_nuget_proxy" {
  description = "Repository Nuget Proxy."
  type = list(object({
    name                     = string
    online                   = optional(bool)
    routing_rule             = optional(string)
    nuget_version            = string
    query_cache_item_max_age = number
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository P2 Proxy
################################################################################
variable "nexus_repository_p2_proxy" {
  description = "Repository P2 Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Pypi Group
################################################################################
variable "nexus_repository_pypi_group" {
  description = "Repository Pypi Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Pypi Hosted
################################################################################
variable "nexus_repository_pypi_hosted" {
  description = "Repository Pypi Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Pypi Proxy
################################################################################
variable "nexus_repository_pypi_proxy" {
  description = "Repository Pypi Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository R Group
################################################################################
variable "nexus_repository_r_group" {
  description = "Repository R Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository R Hosted
################################################################################
variable "nexus_repository_r_hosted" {
  description = "Repository R Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository R Proxy
################################################################################
variable "nexus_repository_r_proxy" {
  description = "Repository R Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Raw Group
################################################################################
variable "nexus_repository_raw_group" {
  description = "Repository Raw Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Raw Hosted
################################################################################
variable "nexus_repository_raw_hosted" {
  description = "Repository Raw Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Raw Proxy
################################################################################
variable "nexus_repository_raw_proxy" {
  description = "Repository Raw Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Rubygems Group
################################################################################
variable "nexus_repository_rubygems_group" {
  description = "Repository Rubygems Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Rubygems Hosted
################################################################################
variable "nexus_repository_rubygems_hosted" {
  description = "Repository Rubygems Hosted."
  type = list(object({
    name   = string
    online = optional(bool)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Rubygems Proxy
################################################################################
variable "nexus_repository_rubygems_proxy" {
  description = "Repository Rubygems Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}

################################################################################
# Repository Yum Group
################################################################################
variable "nexus_repository_yum_group" {
  description = "Repository Pypi Group."
  type = list(object({
    name   = string
    online = optional(bool)
    group = object({
      member_names = set(string)
    })
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
  }))
  default = []
}

################################################################################
# Repository Yum Hosted
################################################################################
variable "nexus_repository_yum_hosted" {
  description = "Repository Yum Hosted."
  type = list(object({
    name           = string
    online         = optional(bool)
    deploy_policy  = optional(string)
    repodata_depth = optional(number)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
    component = optional(object({
      proprietary_components = bool
    }))
  }))
  default = []
}

################################################################################
# Repository Yum Proxy
################################################################################
variable "nexus_repository_yum_proxy" {
  description = "Repository Yum Proxy."
  type = list(object({
    name         = string
    online       = optional(bool)
    routing_rule = optional(string)
    storage = optional(object({
      blob_store_name                = string
      strict_content_type_validation = optional(bool)
    }))
    proxy = object({
      remote_url       = string
      content_max_age  = optional(number)
      metadata_max_age = optional(number)
    })
    negative_cache = optional(object({
      enabled = optional(bool)
      ttl     = optional(string)
    }))
    http_client = object({
      blocked    = bool
      auto_block = bool
      connection = optional(object({
        retries                   = optional(number)
        user_agent_suffix         = optional(string)
        timeout                   = optional(number)
        enable_circular_redirects = optional(bool)
        enable_cookies            = optional(bool)
        use_trust_store           = optional(bool)
      }))
      authentication = optional(object({
        type        = optional(string)
        username    = optional(string)
        password    = optional(string)
        ntlm_host   = optional(string)
        ntlm_domain = optional(string)
      }))
    })
    cleanup = optional(object({
      policy_names = optional(set(string))
    }))
  }))
  default = []
}
