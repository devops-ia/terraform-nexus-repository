################################################################################
# Repository Apt Hosted
################################################################################
module "nexus_repository_apt_hosted" {
  source = "./modules/nexus-repository-apt-hosted"

  for_each = { for r in var.nexus_repository_apt_hosted : r.name => r }

  name         = each.value.name
  online       = each.value.online
  distribution = each.value.distribution
  signing      = each.value.signing
  storage      = each.value.storage
  cleanup      = each.value.cleanup
  component    = each.value.component
}

################################################################################
# Repository Apt Proxy
################################################################################
module "nexus_repository_apt_proxy" {
  source = "./modules/nexus-repository-apt-proxy"

  for_each = { for r in var.nexus_repository_apt_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  routing_rule   = each.value.routing_rule
  distribution   = each.value.distribution
  flat           = each.value.flat
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
  cleanup        = each.value.cleanup
}

################################################################################
# Repository Bower Group
################################################################################
module "nexus_repository_bower_group" {
  source = "./modules/nexus-repository-bower-group"

  for_each = { for r in var.nexus_repository_bower_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Bower Hosted
################################################################################
module "nexus_repository_bower_hosted" {
  source = "./modules/nexus-repository-bower-hosted"

  for_each = { for r in var.nexus_repository_bower_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Bower Proxy
################################################################################
module "nexus_repository_bower_proxy" {
  source = "./modules/nexus-repository-bower-proxy"

  for_each = { for r in var.nexus_repository_bower_proxy : r.name => r }

  name                 = each.value.name
  online               = each.value.online
  rewrite_package_urls = each.value.rewrite_package_urls
  storage              = each.value.storage
  proxy                = each.value.proxy
  negative_cache       = each.value.negative_cache
  http_client          = each.value.http_client
}

################################################################################
# Repository Cocoapods Proxy
################################################################################
module "nexus_repository_cocoapods_proxy" {
  source = "./modules/nexus-repository-cocoapods-proxy"

  for_each = { for r in var.nexus_repository_cocoapods_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Conan Proxy
################################################################################
module "nexus_repository_conan_proxy" {
  source = "./modules/nexus-repository-conan-proxy"

  for_each = { for r in var.nexus_repository_conan_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Conda Proxy
################################################################################
module "nexus_repository_conda_proxy" {
  source = "./modules/nexus-repository-conda-proxy"

  for_each = { for r in var.nexus_repository_conda_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Docker Group
################################################################################
module "nexus_repository_docker_group" {
  source = "./modules/nexus-repository-docker-group"

  for_each = { for r in var.nexus_repository_docker_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  docker  = each.value.docker
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Docker Hosted
################################################################################
module "nexus_repository_docker_hosted" {
  source = "./modules/nexus-repository-docker-hosted"

  for_each = { for r in var.nexus_repository_docker_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  docker    = each.value.docker
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Docker Proxy
################################################################################
module "nexus_repository_docker_proxy" {
  source = "./modules/nexus-repository-docker-proxy"

  for_each = { for r in var.nexus_repository_docker_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  docker         = each.value.docker
  docker_proxy   = each.value.docker_proxy
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Gitlfs Hosted
################################################################################
module "nexus_repository_gitlfs_hosted" {
  source = "./modules/nexus-repository-gitlfs-hosted"

  for_each = { for r in var.nexus_repository_gitlfs_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Go Group
################################################################################
module "nexus_repository_go_group" {
  source = "./modules/nexus-repository-go-group"

  for_each = { for r in var.nexus_repository_go_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Go Proxy
################################################################################
module "nexus_repository_go_proxy" {
  source = "./modules/nexus-repository-go-proxy"

  for_each = { for r in var.nexus_repository_go_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Helm Hosted
################################################################################
module "nexus_repository_helm_hosted" {
  source = "./modules/nexus-repository-helm-hosted"

  for_each = { for r in var.nexus_repository_helm_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Helm Proxy
################################################################################
module "nexus_repository_helm_proxy" {
  source = "./modules/nexus-repository-helm-proxy"

  for_each = { for r in var.nexus_repository_helm_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Maven Group
################################################################################
module "nexus_repository_maven_group" {
  source = "./modules/nexus-repository-maven-group"

  for_each = { for r in var.nexus_repository_maven_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Maven Hosted
################################################################################
module "nexus_repository_maven_hosted" {
  source = "./modules/nexus-repository-maven-hosted"

  for_each = { for r in var.nexus_repository_maven_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  maven     = each.value.maven
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Maven Proxy
################################################################################
module "nexus_repository_maven_proxy" {
  source = "./modules/nexus-repository-maven-proxy"

  for_each = { for r in var.nexus_repository_maven_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
  maven          = each.value.maven
}

################################################################################
# Repository Npm Group
################################################################################
module "nexus_repository_npm_group" {
  source = "./modules/nexus-repository-npm-group"

  for_each = { for r in var.nexus_repository_npm_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Npm Hosted
################################################################################
module "nexus_repository_npm_hosted" {
  source = "./modules/nexus-repository-npm-hosted"

  for_each = { for r in var.nexus_repository_npm_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Npm Proxy
################################################################################
module "nexus_repository_npm_proxy" {
  source = "./modules/nexus-repository-npm-proxy"

  for_each = { for r in var.nexus_repository_npm_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Nuget Group
################################################################################
module "nexus_repository_nuget_group" {
  source = "./modules/nexus-repository-nuget-group"

  for_each = { for r in var.nexus_repository_nuget_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Nuget Hosted
################################################################################
module "nexus_repository_nuget_hosted" {
  source = "./modules/nexus-repository-nuget-hosted"

  for_each = { for r in var.nexus_repository_nuget_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Nuget Proxy
################################################################################
module "nexus_repository_nuget_proxy" {
  source = "./modules/nexus-repository-nuget-proxy"

  for_each = { for r in var.nexus_repository_nuget_proxy : r.name => r }

  name                     = each.value.name
  online                   = each.value.online
  nuget_version            = each.value.nuget_version
  query_cache_item_max_age = each.value.query_cache_item_max_age
  storage                  = each.value.storage
  proxy                    = each.value.proxy
  negative_cache           = each.value.negative_cache
  http_client              = each.value.http_client
}

################################################################################
# Repository P2 Proxy
################################################################################
module "nexus_repository_p2_proxy" {
  source = "./modules/nexus-repository-p2-proxy"

  for_each = { for r in var.nexus_repository_p2_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Pypi Group
################################################################################
module "nexus_repository_pypi_group" {
  source = "./modules/nexus-repository-pypi-group"

  for_each = { for r in var.nexus_repository_pypi_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Pypi Hosted
################################################################################
module "nexus_repository_pypi_hosted" {
  source = "./modules/nexus-repository-pypi-hosted"

  for_each = { for r in var.nexus_repository_pypi_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Pypi Proxy
################################################################################
module "nexus_repository_pypi_proxy" {
  source = "./modules/nexus-repository-pypi-proxy"

  for_each = { for r in var.nexus_repository_pypi_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository R Group
################################################################################
module "nexus_repository_r_group" {
  source = "./modules/nexus-repository-r-group"

  for_each = { for r in var.nexus_repository_r_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository R Hosted
################################################################################
module "nexus_repository_r_hosted" {
  source = "./modules/nexus-repository-r-hosted"

  for_each = { for r in var.nexus_repository_r_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository R Proxy
################################################################################
module "nexus_repository_r_proxy" {
  source = "./modules/nexus-repository-r-proxy"

  for_each = { for r in var.nexus_repository_r_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client

}

################################################################################
# Repository Raw Group
################################################################################
module "nexus_repository_raw_group" {
  source = "./modules/nexus-repository-raw-group"

  for_each = { for r in var.nexus_repository_raw_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Raw Hosted
################################################################################
module "nexus_repository_raw_hosted" {
  source = "./modules/nexus-repository-raw-hosted"

  for_each = { for r in var.nexus_repository_raw_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Raw Proxy
################################################################################
module "nexus_repository_raw_proxy" {
  source = "./modules/nexus-repository-raw-proxy"

  for_each = { for r in var.nexus_repository_raw_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Rubygems Group
################################################################################
module "nexus_repository_rubygems_group" {
  source = "./modules/nexus-repository-rubygems-group"

  for_each = { for r in var.nexus_repository_rubygems_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Rubygems Hosted
################################################################################
module "nexus_repository_rubygems_hosted" {
  source = "./modules/nexus-repository-rubygems-hosted"

  for_each = { for r in var.nexus_repository_rubygems_hosted : r.name => r }

  name      = each.value.name
  online    = each.value.online
  storage   = each.value.storage
  cleanup   = each.value.cleanup
  component = each.value.component
}

################################################################################
# Repository Rubygems Proxy
################################################################################
module "nexus_repository_rubygems_proxy" {
  source = "./modules/nexus-repository-rubygems-proxy"

  for_each = { for r in var.nexus_repository_rubygems_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}

################################################################################
# Repository Yum Group
################################################################################
module "nexus_repository_yum_group" {
  source = "./modules/nexus-repository-yum-group"

  for_each = { for r in var.nexus_repository_yum_group : r.name => r }

  name    = each.value.name
  online  = each.value.online
  group   = each.value.group
  storage = each.value.storage
}

################################################################################
# Repository Yum Hosted
################################################################################
module "nexus_repository_yum_hosted" {
  source = "./modules/nexus-repository-yum-hosted"

  for_each = { for r in var.nexus_repository_yum_hosted : r.name => r }

  name           = each.value.name
  online         = each.value.online
  deploy_policy  = each.value.deploy_policy
  repodata_depth = each.value.repodata_depth
  storage        = each.value.storage
  cleanup        = each.value.cleanup
  component      = each.value.component
}

################################################################################
# Repository Yum Proxy
################################################################################
module "nexus_repository_yum_proxy" {
  source = "./modules/nexus-repository-yum-proxy"

  for_each = { for r in var.nexus_repository_yum_proxy : r.name => r }

  name           = each.value.name
  online         = each.value.online
  storage        = each.value.storage
  proxy          = each.value.proxy
  negative_cache = each.value.negative_cache
  http_client    = each.value.http_client
}
