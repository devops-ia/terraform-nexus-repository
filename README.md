# Nexus Repository

This module allows you to create **Nexus Repository as a global resource** and **individual Nexus Repository resources.** For individual examples, see the usage snippets and [examples](https://github.com/devops-ia/terraform-nexus-repository/tree/main/examples).

## Provider
You need use a [Nexus provider](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs).
```hcl
provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}
```

## Root module usage

`nexus-repository`:

```hcl
module "nexus_repository" {
  source  = "devops-ia/repository/nexus"

  nexus_repository_apt_hosted = [
    {
      name         = "apt-hosted"
      online       = true
      distribution = "bullseye"
      signing = {
        keypair    = "keypair"
        passphrase = "passphrase"
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
        write_policy                   = "ALLOW"
      }
      cleanup = {
        policy_names = ["policy"]
      }
      component = {
        proprietary_components = false
      }
    }
  ]
  
  nexus_repository_apt_proxy = [
    {
      name         = "apt-proxy"
      online       = true
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
  ]
  
  nexus_repository_bower_group = [
    {
      name   = "bower-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2",
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_bower_hosted = [
    {
      name   = "bower-hosted"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
        write_policy                   = "ALLOW"
      }
      cleanup = {
        policy_names = ["policy"]
      }
      component = {
        proprietary_components = false
      }
    }
  ]
  
  nexus_repository_bower_proxy = [
    {
      name                 = "bower-proxy"
      online               = true
      rewrite_package_urls = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://registry.bower.io"
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
  ]
  
  nexus_repository_cocoapods_proxy = [
    {
      name   = "cocoapods-proxy"
      online = true
  
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://cocoapods.org/"
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
  ]
  
  nexus_repository_conan_proxy = [
    {
      name   = "conan-proxy"
      online = true
  
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://center.conan.io"
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
  ]
  
  nexus_repository_conda_proxy = [
    {
      name   = "conda-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://repo.anaconda.com/pkgs/"
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
  ]
  
  nexus_repository_docker_group = [
    {
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
  ]
  
  nexus_repository_docker_hosted = [
    {
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
  ]
  
  nexus_repository_docker_proxy = [
    {
      name   = "docker-proxy"
      online = true
      docker = {
        force_basic_auth = false
        v1_enabled       = false
        subdomain        = "docker" # Pro-only
      }
      docker_proxy = {
        index_type = "HUB"
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://registry-1.docker.io"
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
  ]
  
  nexus_repository_gitlfs_hosted = [
    {
      name   = "gitlfs-internal"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = false
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_go_group = [
    {
      name   = "go-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_go_proxy = [
    {
      name   = "docker-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://proxy.golang.org/"
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
  ]
  
  nexus_repository_helm_hosted = [
    {
      name   = "helm-internal"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = false
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_helm_proxy = [
    {
      name   = "helm-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://kubernetes-charts.storage.googleapis.com/"
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
  ]
  
  nexus_repository_maven_group = [
    {
      name   = "maven-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_maven_hosted = [
    {
      name   = "maven-releases"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = false
        write_policy                   = "ALLOW"
      }
      maven = {
        version_policy      = "RELEASE"
        layout_policy       = "STRICT"
        content_disposition = "INLINE"
      }
    }
  ]
  
  nexus_repository_maven_proxy = [
    {
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
  ]
  nexus_repository_npm_group = [
    {
      name   = "npm-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_npm_hosted = [
    {
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
  ]
  
  nexus_repository_npm_proxy = [
    {
      name   = "npm-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://npmjs.org/"
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
  ]
  
  nexus_repository_nuget_group = [
    {
      name   = "nuget-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_nuget_hosted = [
    {
      name   = "nuget-internal"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_nuget_proxy = [
    {
      name                     = "nuget-proxy"
      online                   = true
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
  ]
  
  nexus_repository_p2_proxy = [
    {
      name   = "p2-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://download.eclipse.org/releases/2019-09"
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
  ]
  
  nexus_repository_pypi_group = [
    {
      name   = "pypi-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_pypi_hosted = [
    {
      name   = "nuget-internal"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_pypi_proxy = [
    {
      name   = "pypi-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://pypi.org"
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
  ]
  
  nexus_repository_r_group = [
    {
      name   = "r-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_r_hosted = [
    {
      name   = "r-hosted"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_r_proxy = [
    {
      name   = "r-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://r-example.org"
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
  ]
  
  nexus_repository_raw_group = [
    {
      name   = "raw-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_raw_hosted = [
    {
      name   = "raw-hosted"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = false
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_raw_proxy = [
    {
      name   = "raw-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://repo1.raw.org/raw2/"
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
  ]
  
  nexus_repository_rubygems_group = [
    {
      name   = "rubygems-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_rubygems_hosted = [
    {
      name   = "rubygems-hosted"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
        write_policy                   = "ALLOW"
      }
    }
  ]
  
  nexus_repository_rubygems_proxy = [
    {
      name   = "rubygems-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://rubygems.org"
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
  ]
  
  nexus_repository_yum_group = [
    {
      name   = "yum-group"
      online = true
      group = {
        member_names = [
          "member1",
          "member2"
        ]
      }
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
    }
  ]
  
  nexus_repository_yum_hosted = [
    {
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
  ]
  
  nexus_repository_yum_proxy = [
    {
      name   = "rubygems-proxy"
      online = true
      storage = {
        blob_store_name                = "default"
        strict_content_type_validation = true
      }
      proxy = {
        remote_url       = "https://rubygems.org"
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
  ]
}
```


## Individual module usage

`nexus-repository-apt-hosted`:

```hcl
module "nexus_repository_apt_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-apt-hosted"
  
  name   = "apt-hosted"
  online = true

  distribution = "bullseye"

  signing = {
    keypair    = "keypair"
    passphrase = "passphrase"
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }

  cleanup = {
    policy_names = ["policy"]
  }

  component = {
    proprietary_components = false
  }
}
```

`nexus-repository-apt-proxy`:

```hcl
module "nexus_repository_apt_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-apt-proxy"
  
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
```

`nexus-repository-bower-group`:

```hcl
module "nexus_repository_bower_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-bower-group"
  
  name   = "bower-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2",
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-bower-hosted`:

```hcl
module "nexus_repository_bower_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-bower-hosted"
  
  name   = "bower-hosted"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }

  cleanup = {
    policy_names = ["policy"]
  }

  component = {
    proprietary_components = false
  }
}
```

`nexus-repository-bower-proxy`:

```hcl
module "nexus_repository_bower_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-bower-proxy"
  
  name   = "bower-proxy"
  online = true

  rewrite_package_urls = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://registry.bower.io"
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
```

`nexus-repository-cocoapods-proxy`:

```hcl
module "nexus_repository_cocoapods_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-cocoapods-proxy"
  
  name   = "cocoapods-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://cocoapods.org/"
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
```

`nexus-repository-conan-proxy`:

```hcl
module "nexus_repository_conan_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-conan-proxy"
  
  name   = "conan-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://center.conan.io"
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
```

`nexus-repository-conda-proxy`:

```hcl
module "nexus_repository_conda_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-conda-proxy"
  
  name   = "conda-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://repo.anaconda.com/pkgs/"
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
```

`nexus-repository-docker-group`:

```hcl
module "nexus_repository_docker_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-docker-group"
  
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
```

`nexus-repository-docker-hosted`:

```hcl
module "nexus_repository_docker_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-docker-hosted"
  
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
```

`nexus-repository-docker-proxy`:

```hcl
module "nexus_repository_docker_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-docker-proxy"
  
  name   = "docker-proxy"
  online = true

  docker = {
    force_basic_auth = false
    v1_enabled       = false
    subdomain        = "docker" # Pro-only
  }

  docker_proxy = {
    index_type = "HUB"
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://registry-1.docker.io"
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
```

`nexus-repository-gitlfs-hosted`:

```hcl
module "nexus_repository_gitlfs_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-gitlfs-hosted"
  
  name   = "gitlfs-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-go-group`:

```hcl
module "nexus_repository_go_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-go-group"
  
  name   = "go-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-go-proxy`:

```hcl
module "nexus_repository_go_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-go-proxy"
  
  name   = "docker-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://proxy.golang.org/"
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
```

`nexus-repository-helm-hosted`:

```hcl
module "nexus_repository_helm_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-helm-hosted"
  
  name   = "helm-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-helm-proxy`:

```hcl
module "nexus_repository_helm_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-helm-proxy"
  
  name   = "helm-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://kubernetes-charts.storage.googleapis.com/"
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
```

`nexus-repository-maven-group`:

```hcl
module "nexus_repository_maven_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-maven-group"
  
  name   = "maven-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-maven-hosted`:

```hcl
module "nexus_repository_maven_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-maven-hosted"
  
  name   = "maven-releases"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }

  maven = {
    version_policy      = "RELEASE"
    layout_policy       = "STRICT"
    content_disposition = "INLINE"
  }
}
```

`nexus-repository-maven-proxy`:

```hcl
module "nexus_repository_maven_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-maven-proxy"
  
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
```

`nexus-repository-npm-group`:

```hcl
module "nexus_repository_npm_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-npm-group"
  
  name   = "npm-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-npm-hosted`:

```hcl
module "nexus_repository_npm_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-npm-hosted"
  
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
```

`nexus-repository-npm-proxy`:

```hcl
module "nexus_repository_npm_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-npm-proxy"
  
  name   = "npm-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://npmjs.org/"
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
```

`nexus-repository-nuget-group`:

```hcl
module "nexus_repository_nuget_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-uget-group"
  
  name   = "nuget-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-nuget-hosted`:

```hcl
module "nexus_repository_nuget_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-uget-hosted"
  
  name   = "nuget-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-nuget-proxy`:

```hcl
module "nexus_repository_nuget_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-nuget-proxy"
  
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
```

`nexus-repository-p2-proxy`:

```hcl
module "nexus_repository_p2_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-p2-proxy"
  
  name   = "p2-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://download.eclipse.org/releases/2019-09"
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
```

`nexus-repository-pypi-group`:

```hcl
module "nexus_repository_pypi_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-pypi-proxy"
  
  name   = "pypi-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-pypi-hosted`:

```hcl
module "nexus_repository_pypi_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-pypi-hosted"
  
  name   = "nuget-internal"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-pypi-proxy`:

```hcl
module "nexus_repository_pypi_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-pypi-proxy"
  
  name   = "pypi-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://pypi.org"
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
```

`nexus-repository-r-group`:

```hcl
module "nexus_repository_r_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-r-group"
  
  name   = "r-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-r-hosted`:

```hcl
module "nexus_repository_r_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-r-hosted"
  
  name   = "r-hosted"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-r-proxy`:

```hcl
module "nexus_repository_r_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-r-proxy"
  
  name   = "r-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://r-example.org"
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
```

`nexus-repository-raw-hosted`:

```hcl
module "nexus_repository_raw_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-raw-hosted"
  
  name   = "raw-hosted"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-raw-proxy`:

```hcl
module "nexus_repository_raw_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-raw-proxy"
  
  name   = "raw-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://repo1.raw.org/raw2/"
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
```

`nexus-repository-rubygems-group`:

```hcl
module "nexus_repository_rubygems_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-rubygems-group"
  
  name   = "rubygems-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-rubygems-hosted`:

```hcl
module "nexus_repository_rubygems_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-rubygems-hosted"
  
  name   = "rubygems-hosted"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}
```

`nexus-repository-rubygems-proxy`:

```hcl
module "nexus_repository_rubygems_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-rubygems-proxy"
  
  name   = "rubygems-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://rubygems.org"
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
```

`nexus-repository-yum-group`:

```hcl
module "nexus_repository_yum_group" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-yum-group"
  
  name   = "yum-group"
  online = true

  group = {
    member_names = [
      "member1",
      "member2"
    ]
  }

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }
}
```

`nexus-repository-yum-hosted`:

```hcl
module "nexus_repository_yum_hosted" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-yum-hosted"
  
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
```

`nexus-repository-yum-proxy`:

```hcl
module "nexus_repository_yum_proxy" {
  source  = "devops-ia/repository/nexus//modules/nexus-repository-yum-proxy"
  
  name   = "rubygems-proxy"
  online = true

  storage = {
    blob_store_name                = "default"
    strict_content_type_validation = true
  }

  proxy = {
    remote_url       = "https://rubygems.org"
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
```

## Terraform Docs

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 2.0.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nexus_repository_apt_hosted"></a> [nexus\_repository\_apt\_hosted](#module\_nexus\_repository\_apt\_hosted) | ./modules/nexus-repository-apt-hosted | n/a |
| <a name="module_nexus_repository_apt_proxy"></a> [nexus\_repository\_apt\_proxy](#module\_nexus\_repository\_apt\_proxy) | ./modules/nexus-repository-apt-proxy | n/a |
| <a name="module_nexus_repository_bower_group"></a> [nexus\_repository\_bower\_group](#module\_nexus\_repository\_bower\_group) | ./modules/nexus-repository-bower-group | n/a |
| <a name="module_nexus_repository_bower_hosted"></a> [nexus\_repository\_bower\_hosted](#module\_nexus\_repository\_bower\_hosted) | ./modules/nexus-repository-bower-hosted | n/a |
| <a name="module_nexus_repository_bower_proxy"></a> [nexus\_repository\_bower\_proxy](#module\_nexus\_repository\_bower\_proxy) | ./modules/nexus-repository-bower-proxy | n/a |
| <a name="module_nexus_repository_cocoapods_proxy"></a> [nexus\_repository\_cocoapods\_proxy](#module\_nexus\_repository\_cocoapods\_proxy) | ./modules/nexus-repository-cocoapods-proxy | n/a |
| <a name="module_nexus_repository_conan_proxy"></a> [nexus\_repository\_conan\_proxy](#module\_nexus\_repository\_conan\_proxy) | ./modules/nexus-repository-conan-proxy | n/a |
| <a name="module_nexus_repository_conda_proxy"></a> [nexus\_repository\_conda\_proxy](#module\_nexus\_repository\_conda\_proxy) | ./modules/nexus-repository-conda-proxy | n/a |
| <a name="module_nexus_repository_docker_group"></a> [nexus\_repository\_docker\_group](#module\_nexus\_repository\_docker\_group) | ./modules/nexus-repository-docker-group | n/a |
| <a name="module_nexus_repository_docker_hosted"></a> [nexus\_repository\_docker\_hosted](#module\_nexus\_repository\_docker\_hosted) | ./modules/nexus-repository-docker-hosted | n/a |
| <a name="module_nexus_repository_docker_proxy"></a> [nexus\_repository\_docker\_proxy](#module\_nexus\_repository\_docker\_proxy) | ./modules/nexus-repository-docker-proxy | n/a |
| <a name="module_nexus_repository_gitlfs_hosted"></a> [nexus\_repository\_gitlfs\_hosted](#module\_nexus\_repository\_gitlfs\_hosted) | ./modules/nexus-repository-gitlfs-hosted | n/a |
| <a name="module_nexus_repository_go_group"></a> [nexus\_repository\_go\_group](#module\_nexus\_repository\_go\_group) | ./modules/nexus-repository-go-group | n/a |
| <a name="module_nexus_repository_go_proxy"></a> [nexus\_repository\_go\_proxy](#module\_nexus\_repository\_go\_proxy) | ./modules/nexus-repository-go-proxy | n/a |
| <a name="module_nexus_repository_helm_hosted"></a> [nexus\_repository\_helm\_hosted](#module\_nexus\_repository\_helm\_hosted) | ./modules/nexus-repository-helm-hosted | n/a |
| <a name="module_nexus_repository_helm_proxy"></a> [nexus\_repository\_helm\_proxy](#module\_nexus\_repository\_helm\_proxy) | ./modules/nexus-repository-helm-proxy | n/a |
| <a name="module_nexus_repository_maven_group"></a> [nexus\_repository\_maven\_group](#module\_nexus\_repository\_maven\_group) | ./modules/nexus-repository-maven-group | n/a |
| <a name="module_nexus_repository_maven_hosted"></a> [nexus\_repository\_maven\_hosted](#module\_nexus\_repository\_maven\_hosted) | ./modules/nexus-repository-maven-hosted | n/a |
| <a name="module_nexus_repository_maven_proxy"></a> [nexus\_repository\_maven\_proxy](#module\_nexus\_repository\_maven\_proxy) | ./modules/nexus-repository-maven-proxy | n/a |
| <a name="module_nexus_repository_npm_group"></a> [nexus\_repository\_npm\_group](#module\_nexus\_repository\_npm\_group) | ./modules/nexus-repository-npm-group | n/a |
| <a name="module_nexus_repository_npm_hosted"></a> [nexus\_repository\_npm\_hosted](#module\_nexus\_repository\_npm\_hosted) | ./modules/nexus-repository-npm-hosted | n/a |
| <a name="module_nexus_repository_npm_proxy"></a> [nexus\_repository\_npm\_proxy](#module\_nexus\_repository\_npm\_proxy) | ./modules/nexus-repository-npm-proxy | n/a |
| <a name="module_nexus_repository_nuget_group"></a> [nexus\_repository\_nuget\_group](#module\_nexus\_repository\_nuget\_group) | ./modules/nexus-repository-nuget-group | n/a |
| <a name="module_nexus_repository_nuget_hosted"></a> [nexus\_repository\_nuget\_hosted](#module\_nexus\_repository\_nuget\_hosted) | ./modules/nexus-repository-nuget-hosted | n/a |
| <a name="module_nexus_repository_nuget_proxy"></a> [nexus\_repository\_nuget\_proxy](#module\_nexus\_repository\_nuget\_proxy) | ./modules/nexus-repository-nuget-proxy | n/a |
| <a name="module_nexus_repository_p2_proxy"></a> [nexus\_repository\_p2\_proxy](#module\_nexus\_repository\_p2\_proxy) | ./modules/nexus-repository-p2-proxy | n/a |
| <a name="module_nexus_repository_pypi_group"></a> [nexus\_repository\_pypi\_group](#module\_nexus\_repository\_pypi\_group) | ./modules/nexus-repository-pypi-group | n/a |
| <a name="module_nexus_repository_pypi_hosted"></a> [nexus\_repository\_pypi\_hosted](#module\_nexus\_repository\_pypi\_hosted) | ./modules/nexus-repository-pypi-hosted | n/a |
| <a name="module_nexus_repository_pypi_proxy"></a> [nexus\_repository\_pypi\_proxy](#module\_nexus\_repository\_pypi\_proxy) | ./modules/nexus-repository-pypi-proxy | n/a |
| <a name="module_nexus_repository_r_group"></a> [nexus\_repository\_r\_group](#module\_nexus\_repository\_r\_group) | ./modules/nexus-repository-r-group | n/a |
| <a name="module_nexus_repository_r_hosted"></a> [nexus\_repository\_r\_hosted](#module\_nexus\_repository\_r\_hosted) | ./modules/nexus-repository-r-hosted | n/a |
| <a name="module_nexus_repository_r_proxy"></a> [nexus\_repository\_r\_proxy](#module\_nexus\_repository\_r\_proxy) | ./modules/nexus-repository-r-proxy | n/a |
| <a name="module_nexus_repository_raw_group"></a> [nexus\_repository\_raw\_group](#module\_nexus\_repository\_raw\_group) | ./modules/nexus-repository-raw-group | n/a |
| <a name="module_nexus_repository_raw_hosted"></a> [nexus\_repository\_raw\_hosted](#module\_nexus\_repository\_raw\_hosted) | ./modules/nexus-repository-raw-hosted | n/a |
| <a name="module_nexus_repository_raw_proxy"></a> [nexus\_repository\_raw\_proxy](#module\_nexus\_repository\_raw\_proxy) | ./modules/nexus-repository-raw-proxy | n/a |
| <a name="module_nexus_repository_rubygems_group"></a> [nexus\_repository\_rubygems\_group](#module\_nexus\_repository\_rubygems\_group) | ./modules/nexus-repository-rubygems-group | n/a |
| <a name="module_nexus_repository_rubygems_hosted"></a> [nexus\_repository\_rubygems\_hosted](#module\_nexus\_repository\_rubygems\_hosted) | ./modules/nexus-repository-rubygems-hosted | n/a |
| <a name="module_nexus_repository_rubygems_proxy"></a> [nexus\_repository\_rubygems\_proxy](#module\_nexus\_repository\_rubygems\_proxy) | ./modules/nexus-repository-rubygems-proxy | n/a |
| <a name="module_nexus_repository_yum_group"></a> [nexus\_repository\_yum\_group](#module\_nexus\_repository\_yum\_group) | ./modules/nexus-repository-yum-group | n/a |
| <a name="module_nexus_repository_yum_hosted"></a> [nexus\_repository\_yum\_hosted](#module\_nexus\_repository\_yum\_hosted) | ./modules/nexus-repository-yum-hosted | n/a |
| <a name="module_nexus_repository_yum_proxy"></a> [nexus\_repository\_yum\_proxy](#module\_nexus\_repository\_yum\_proxy) | ./modules/nexus-repository-yum-proxy | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nexus_repository_apt_hosted"></a> [nexus\_repository\_apt\_hosted](#input\_nexus\_repository\_apt\_hosted) | Repository Apt Hosted. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    distribution = string<br>    signing = object({<br>      keypair    = string<br>      passphrase = optional(string)<br>    })<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = bool<br>      write_policy                   = optional(string)<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_apt_proxy"></a> [nexus\_repository\_apt\_proxy](#input\_nexus\_repository\_apt\_proxy) | Repository Apt Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    distribution = string<br>    flat         = bool<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    })<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_bower_group"></a> [nexus\_repository\_bower\_group](#input\_nexus\_repository\_bower\_group) | Repository Bower Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_bower_hosted"></a> [nexus\_repository\_bower\_hosted](#input\_nexus\_repository\_bower\_hosted) | Repository Bower Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = bool<br>      write_policy                   = optional(string)<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_bower_proxy"></a> [nexus\_repository\_bower\_proxy](#input\_nexus\_repository\_bower\_proxy) | Repository Bower Proxy. | <pre>list(object({<br>    name                 = string<br>    online               = optional(bool)<br>    rewrite_package_urls = bool<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    })<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_cocoapods_proxy"></a> [nexus\_repository\_cocoapods\_proxy](#input\_nexus\_repository\_cocoapods\_proxy) | Repository Cocoapods Proxy. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    })<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_conan_proxy"></a> [nexus\_repository\_conan\_proxy](#input\_nexus\_repository\_conan\_proxy) | value | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    })<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_conda_proxy"></a> [nexus\_repository\_conda\_proxy](#input\_nexus\_repository\_conda\_proxy) | Repository Conda Proxy. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    })<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_docker_group"></a> [nexus\_repository\_docker\_group](#input\_nexus\_repository\_docker\_group) | Repository Docker Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    docker = object({<br>      force_basic_auth = bool<br>      http_port        = optional(number)<br>      https_port       = optional(number)<br>      v1_enabled       = bool<br>      subdomain        = optional(string)<br>    })<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_docker_hosted"></a> [nexus\_repository\_docker\_hosted](#input\_nexus\_repository\_docker\_hosted) | Repository Docker Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    docker = object({<br>      force_basic_auth = bool<br>      http_port        = optional(number)<br>      https_port       = optional(number)<br>      v1_enabled       = bool<br>      subdomain        = optional(string)<br>    })<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = bool<br>      write_policy                   = optional(string)<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_docker_proxy"></a> [nexus\_repository\_docker\_proxy](#input\_nexus\_repository\_docker\_proxy) | Repository Docker Proxy. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    docker = object({<br>      force_basic_auth = bool<br>      http_port        = optional(number)<br>      https_port       = optional(number)<br>      v1_enabled       = bool<br>      subdomain        = optional(string)<br>    })<br>    docker_proxy = object({<br>      index_type = string<br>      index_url  = optional(string)<br>    })<br>    storage = object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    })<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_gitlfs_hosted"></a> [nexus\_repository\_gitlfs\_hosted](#input\_nexus\_repository\_gitlfs\_hosted) | Repository Gitlfs Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_go_group"></a> [nexus\_repository\_go\_group](#input\_nexus\_repository\_go\_group) | Repository Go Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = optional(set(string))<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_go_proxy"></a> [nexus\_repository\_go\_proxy](#input\_nexus\_repository\_go\_proxy) | Repository Go Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_helm_hosted"></a> [nexus\_repository\_helm\_hosted](#input\_nexus\_repository\_helm\_hosted) | Repository Helm Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_helm_proxy"></a> [nexus\_repository\_helm\_proxy](#input\_nexus\_repository\_helm\_proxy) | Repository Helm Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_maven_group"></a> [nexus\_repository\_maven\_group](#input\_nexus\_repository\_maven\_group) | Repository Maven Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_maven_hosted"></a> [nexus\_repository\_maven\_hosted](#input\_nexus\_repository\_maven\_hosted) | Repository Maven Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    maven = object({<br>      version_policy      = string<br>      layout_policy       = string<br>      content_disposition = optional(string)<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_maven_proxy"></a> [nexus\_repository\_maven\_proxy](#input\_nexus\_repository\_maven\_proxy) | Repository Maven Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    maven = object({<br>      version_policy      = string<br>      layout_policy       = string<br>      content_disposition = optional(string)<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_npm_group"></a> [nexus\_repository\_npm\_group](#input\_nexus\_repository\_npm\_group) | Repository Npm Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_npm_hosted"></a> [nexus\_repository\_npm\_hosted](#input\_nexus\_repository\_npm\_hosted) | Repository Npm Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_npm_proxy"></a> [nexus\_repository\_npm\_proxy](#input\_nexus\_repository\_npm\_proxy) | Repository Npm Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    remove_non_cataloged = optional(bool)<br>    remove_quarantined   = optional(bool)<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_nuget_group"></a> [nexus\_repository\_nuget\_group](#input\_nexus\_repository\_nuget\_group) | Repository Nuget Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_nuget_hosted"></a> [nexus\_repository\_nuget\_hosted](#input\_nexus\_repository\_nuget\_hosted) | Repository Nuget Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_nuget_proxy"></a> [nexus\_repository\_nuget\_proxy](#input\_nexus\_repository\_nuget\_proxy) | Repository Nuget Proxy. | <pre>list(object({<br>    name                     = string<br>    online                   = optional(bool)<br>    routing_rule             = optional(string)<br>    nuget_version            = string<br>    query_cache_item_max_age = number<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_p2_proxy"></a> [nexus\_repository\_p2\_proxy](#input\_nexus\_repository\_p2\_proxy) | Repository P2 Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_pypi_group"></a> [nexus\_repository\_pypi\_group](#input\_nexus\_repository\_pypi\_group) | Repository Pypi Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_pypi_hosted"></a> [nexus\_repository\_pypi\_hosted](#input\_nexus\_repository\_pypi\_hosted) | Repository Pypi Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_pypi_proxy"></a> [nexus\_repository\_pypi\_proxy](#input\_nexus\_repository\_pypi\_proxy) | Repository Pypi Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_r_group"></a> [nexus\_repository\_r\_group](#input\_nexus\_repository\_r\_group) | Repository R Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_r_hosted"></a> [nexus\_repository\_r\_hosted](#input\_nexus\_repository\_r\_hosted) | Repository R Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_r_proxy"></a> [nexus\_repository\_r\_proxy](#input\_nexus\_repository\_r\_proxy) | Repository R Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_raw_group"></a> [nexus\_repository\_raw\_group](#input\_nexus\_repository\_raw\_group) | Repository Raw Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_raw_hosted"></a> [nexus\_repository\_raw\_hosted](#input\_nexus\_repository\_raw\_hosted) | Repository Raw Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_raw_proxy"></a> [nexus\_repository\_raw\_proxy](#input\_nexus\_repository\_raw\_proxy) | Repository Raw Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_rubygems_group"></a> [nexus\_repository\_rubygems\_group](#input\_nexus\_repository\_rubygems\_group) | Repository Rubygems Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_rubygems_hosted"></a> [nexus\_repository\_rubygems\_hosted](#input\_nexus\_repository\_rubygems\_hosted) | Repository Rubygems Hosted. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_rubygems_proxy"></a> [nexus\_repository\_rubygems\_proxy](#input\_nexus\_repository\_rubygems\_proxy) | Repository Rubygems Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_yum_group"></a> [nexus\_repository\_yum\_group](#input\_nexus\_repository\_yum\_group) | Repository Pypi Group. | <pre>list(object({<br>    name   = string<br>    online = optional(bool)<br>    group = object({<br>      member_names = set(string)<br>    })<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_yum_hosted"></a> [nexus\_repository\_yum\_hosted](#input\_nexus\_repository\_yum\_hosted) | Repository Yum Hosted. | <pre>list(object({<br>    name           = string<br>    online         = optional(bool)<br>    deploy_policy  = optional(string)<br>    repodata_depth = optional(number)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>    component = optional(object({<br>      proprietary_components = bool<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_nexus_repository_yum_proxy"></a> [nexus\_repository\_yum\_proxy](#input\_nexus\_repository\_yum\_proxy) | Repository Yum Proxy. | <pre>list(object({<br>    name         = string<br>    online       = optional(bool)<br>    routing_rule = optional(string)<br>    storage = optional(object({<br>      blob_store_name                = string<br>      strict_content_type_validation = optional(bool)<br>    }))<br>    proxy = object({<br>      remote_url       = string<br>      content_max_age  = optional(number)<br>      metadata_max_age = optional(number)<br>    })<br>    negative_cache = optional(object({<br>      enabled = optional(bool)<br>      ttl     = optional(string)<br>    }))<br>    http_client = object({<br>      blocked    = bool<br>      auto_block = bool<br>      connection = optional(object({<br>        retries                   = optional(number)<br>        user_agent_suffix         = optional(string)<br>        timeout                   = optional(number)<br>        enable_circular_redirects = optional(bool)<br>        enable_cookies            = optional(bool)<br>        use_trust_store           = optional(bool)<br>      }))<br>      authentication = optional(object({<br>        type        = optional(string)<br>        username    = optional(string)<br>        password    = optional(string)<br>        ntlm_host   = optional(string)<br>        ntlm_domain = optional(string)<br>      }))<br>    })<br>    cleanup = optional(object({<br>      policy_names = optional(set(string))<br>    }))<br>  }))</pre> | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_apt_hosted"></a> [repository\_apt\_hosted](#output\_repository\_apt\_hosted) | Repository Apt Hosted. |
| <a name="output_repository_apt_proxy"></a> [repository\_apt\_proxy](#output\_repository\_apt\_proxy) | Repository Apt Proxy. |
| <a name="output_repository_bower_group"></a> [repository\_bower\_group](#output\_repository\_bower\_group) | Repository Bower Group. |
| <a name="output_repository_bower_hosted"></a> [repository\_bower\_hosted](#output\_repository\_bower\_hosted) | Repository Bower Hosted. |
| <a name="output_repository_bower_proxy"></a> [repository\_bower\_proxy](#output\_repository\_bower\_proxy) | Repository Bower Proxy. |
| <a name="output_repository_cocoapods_proxy"></a> [repository\_cocoapods\_proxy](#output\_repository\_cocoapods\_proxy) | Repository Cocoapods Proxy. |
| <a name="output_repository_conan_proxy"></a> [repository\_conan\_proxy](#output\_repository\_conan\_proxy) | Repository Conan Proxy. |
| <a name="output_repository_conda_proxy"></a> [repository\_conda\_proxy](#output\_repository\_conda\_proxy) | Repository Conda Proxy. |
| <a name="output_repository_docker_group"></a> [repository\_docker\_group](#output\_repository\_docker\_group) | Repository Docker Group. |
| <a name="output_repository_docker_hosted"></a> [repository\_docker\_hosted](#output\_repository\_docker\_hosted) | Repository Docker Hosted. |
| <a name="output_repository_docker_proxy"></a> [repository\_docker\_proxy](#output\_repository\_docker\_proxy) | Repository Docker Proxy. |
| <a name="output_repository_gitlfs_hosted"></a> [repository\_gitlfs\_hosted](#output\_repository\_gitlfs\_hosted) | Repository Gitlfs Hosted. |
| <a name="output_repository_go_group"></a> [repository\_go\_group](#output\_repository\_go\_group) | Repository Go Group. |
| <a name="output_repository_go_proxy"></a> [repository\_go\_proxy](#output\_repository\_go\_proxy) | Repository Go Proxy. |
| <a name="output_repository_helm_hosted"></a> [repository\_helm\_hosted](#output\_repository\_helm\_hosted) | Repository Helm Hosted. |
| <a name="output_repository_helm_proxy"></a> [repository\_helm\_proxy](#output\_repository\_helm\_proxy) | Repository Helm Proxy. |
| <a name="output_repository_maven_group"></a> [repository\_maven\_group](#output\_repository\_maven\_group) | Repository Maven Group. |
| <a name="output_repository_maven_hosted"></a> [repository\_maven\_hosted](#output\_repository\_maven\_hosted) | Repository Maven Hosted. |
| <a name="output_repository_maven_proxy"></a> [repository\_maven\_proxy](#output\_repository\_maven\_proxy) | Repository Maven Proxy. |
| <a name="output_repository_npm_group"></a> [repository\_npm\_group](#output\_repository\_npm\_group) | Repository Npm Group. |
| <a name="output_repository_npm_hosted"></a> [repository\_npm\_hosted](#output\_repository\_npm\_hosted) | Repository Npm Hosted. |
| <a name="output_repository_npm_proxy"></a> [repository\_npm\_proxy](#output\_repository\_npm\_proxy) | Repository Npm Proxy. |
| <a name="output_repository_nuget_group"></a> [repository\_nuget\_group](#output\_repository\_nuget\_group) | Repository Nuget Group. |
| <a name="output_repository_nuget_hosted"></a> [repository\_nuget\_hosted](#output\_repository\_nuget\_hosted) | Repository Nuget Hosted. |
| <a name="output_repository_nuget_proxy"></a> [repository\_nuget\_proxy](#output\_repository\_nuget\_proxy) | Repository Nuget Proxy. |
| <a name="output_repository_p2_proxy"></a> [repository\_p2\_proxy](#output\_repository\_p2\_proxy) | Repository P2 Proxy. |
| <a name="output_repository_pypi_group"></a> [repository\_pypi\_group](#output\_repository\_pypi\_group) | Repository Pypi Group. |
| <a name="output_repository_pypi_hosted"></a> [repository\_pypi\_hosted](#output\_repository\_pypi\_hosted) | Repository Pypi Hosted. |
| <a name="output_repository_pypi_proxy"></a> [repository\_pypi\_proxy](#output\_repository\_pypi\_proxy) | Repository Pypi Proxy. |
| <a name="output_repository_r_group"></a> [repository\_r\_group](#output\_repository\_r\_group) | Repository R Group. |
| <a name="output_repository_r_hosted"></a> [repository\_r\_hosted](#output\_repository\_r\_hosted) | Repository R Hosted. |
| <a name="output_repository_r_proxy"></a> [repository\_r\_proxy](#output\_repository\_r\_proxy) | Repository R Proxy. |
| <a name="output_repository_raw_group"></a> [repository\_raw\_group](#output\_repository\_raw\_group) | Repository Raw Group. |
| <a name="output_repository_raw_hosted"></a> [repository\_raw\_hosted](#output\_repository\_raw\_hosted) | Repository Raw Hosted. |
| <a name="output_repository_raw_proxy"></a> [repository\_raw\_proxy](#output\_repository\_raw\_proxy) | Repository Raw Proxy. |
| <a name="output_repository_rubygems_group"></a> [repository\_rubygems\_group](#output\_repository\_rubygems\_group) | Repository Rubygems Group. |
| <a name="output_repository_rubygems_hosted"></a> [repository\_rubygems\_hosted](#output\_repository\_rubygems\_hosted) | Repository Rubygems Hosted. |
| <a name="output_repository_rubygems_proxy"></a> [repository\_rubygems\_proxy](#output\_repository\_rubygems\_proxy) | Repository Rubygems Proxy. |
| <a name="output_repository_yum_group"></a> [repository\_yum\_group](#output\_repository\_yum\_group) | Repository Yum Group. |
| <a name="output_repository_yum_hosted"></a> [repository\_yum\_hosted](#output\_repository\_yum\_hosted) | Repository Yum Hosted. |
| <a name="output_repository_yum_proxy"></a> [repository\_yum\_proxy](#output\_repository\_yum\_proxy) | Repository Yum Proxy. |

## Authors

Module is maintained by [DevOps IA](https://github.com/devops-ia) with help from [these awesome contributors](https://github.com/devops-ia/terraform-nexus-repository/graphs/contributors).
