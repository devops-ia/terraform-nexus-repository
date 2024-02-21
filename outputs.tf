################################################################################
# Repository Apt Hosted
################################################################################
output "repository_apt_hosted" {
  description = "Repository Apt Hosted."
  value = [
    for r in module.nexus_repository_apt_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Apt Proxy
################################################################################
output "repository_apt_proxy" {
  description = "Repository Apt Proxy."
  value = [
    for r in module.nexus_repository_apt_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Bower Group
################################################################################
output "repository_bower_group" {
  description = "Repository Bower Group."
  value = [
    for r in module.nexus_repository_bower_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Bower Hosted
################################################################################
output "repository_bower_hosted" {
  description = "Repository Bower Hosted."
  value = [
    for r in module.nexus_repository_bower_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Bower Proxy
################################################################################
output "repository_bower_proxy" {
  description = "Repository Bower Proxy."
  value = [
    for r in module.nexus_repository_bower_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Cocoapods Proxy
################################################################################
output "repository_cocoapods_proxy" {
  description = "Repository Cocoapods Proxy."
  value = [
    for r in module.nexus_repository_cocoapods_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Conan Proxy
################################################################################
output "repository_conan_proxy" {
  description = "Repository Conan Proxy."
  value = [
    for r in module.nexus_repository_conan_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Conda Proxy
################################################################################
output "repository_conda_proxy" {
  description = "Repository Conda Proxy."
  value = [
    for r in module.nexus_repository_conda_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Docker Group
################################################################################
output "repository_docker_group" {
  description = "Repository Docker Group."
  value = [
    for r in module.nexus_repository_docker_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Docker Hosted
################################################################################
output "repository_docker_hosted" {
  description = "Repository Docker Hosted."
  value = [
    for r in module.nexus_repository_docker_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Docker Proxy
################################################################################
output "repository_docker_proxy" {
  description = "Repository Docker Proxy."
  value = [
    for r in module.nexus_repository_docker_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Gitlfs Hosted
################################################################################
output "repository_gitlfs_hosted" {
  description = "Repository Gitlfs Hosted."
  value = [
    for r in module.nexus_repository_gitlfs_hosted : {
      name = r.name
    }
  ]
}


################################################################################
# Repository Go Group
################################################################################
output "repository_go_group" {
  description = "Repository Go Group."
  value = [
    for r in module.nexus_repository_go_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Go Proxy
################################################################################
output "repository_go_proxy" {
  description = "Repository Go Proxy."
  value = [
    for r in module.nexus_repository_go_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Helm Hosted
################################################################################
output "repository_helm_hosted" {
  description = "Repository Helm Hosted."
  value = [
    for r in module.nexus_repository_helm_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Helm Proxy
################################################################################
output "repository_helm_proxy" {
  description = "Repository Helm Proxy."
  value = [
    for r in module.nexus_repository_helm_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Maven Group
################################################################################
output "repository_maven_group" {
  description = "Repository Maven Group."
  value = [
    for r in module.nexus_repository_maven_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Maven Hosted
################################################################################
output "repository_maven_hosted" {
  description = "Repository Maven Hosted."
  value = [
    for r in module.nexus_repository_maven_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Maven Proxy
################################################################################
output "repository_maven_proxy" {
  description = "Repository Maven Proxy."
  value = [
    for r in module.nexus_repository_maven_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Npm Group
################################################################################
output "repository_npm_group" {
  description = "Repository Npm Group."
  value = [
    for r in module.nexus_repository_npm_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Npm Hosted
################################################################################
output "repository_npm_hosted" {
  description = "Repository Npm Hosted."
  value = [
    for r in module.nexus_repository_npm_hosted : {
      name = r.name
    }
  ]
}


################################################################################
# Repository Npm Proxy
################################################################################
output "repository_npm_proxy" {
  description = "Repository Npm Proxy."
  value = [
    for r in module.nexus_repository_npm_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Nuget Group
################################################################################
output "repository_nuget_group" {
  description = "Repository Nuget Group."
  value = [
    for r in module.nexus_repository_nuget_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Nuget Hosted
################################################################################
output "repository_nuget_hosted" {
  description = "Repository Nuget Hosted."
  value = [
    for r in module.nexus_repository_nuget_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Nuget Proxy
################################################################################
output "repository_nuget_proxy" {
  description = "Repository Nuget Proxy."
  value = [
    for r in module.nexus_repository_nuget_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository P2 Proxy
################################################################################
output "repository_p2_proxy" {
  description = "Repository P2 Proxy."
  value = [
    for r in module.nexus_repository_p2_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Pypi Group
################################################################################
output "repository_pypi_group" {
  description = "Repository Pypi Group."
  value = [
    for r in module.nexus_repository_pypi_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Pypi Hosted
################################################################################
output "repository_pypi_hosted" {
  description = "Repository Pypi Hosted."
  value = [
    for r in module.nexus_repository_pypi_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Pypi Proxy
################################################################################
output "repository_pypi_proxy" {
  description = "Repository Pypi Proxy."
  value = [
    for r in module.nexus_repository_pypi_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository R Group
################################################################################
output "repository_r_group" {
  description = "Repository R Group."
  value = [
    for r in module.nexus_repository_r_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository R Hosted
################################################################################
output "repository_r_hosted" {
  description = "Repository R Hosted."
  value = [
    for r in module.nexus_repository_r_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository R Proxy
################################################################################
output "repository_r_proxy" {
  description = "Repository R Proxy."
  value = [
    for r in module.nexus_repository_r_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Raw Group
################################################################################
output "repository_raw_group" {
  description = "Repository Raw Group."
  value = [
    for r in module.nexus_repository_raw_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Raw Hosted
################################################################################
output "repository_raw_hosted" {
  description = "Repository Raw Hosted."
  value = [
    for r in module.nexus_repository_raw_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Raw Proxy
################################################################################
output "repository_raw_proxy" {
  description = "Repository Raw Proxy."
  value = [
    for r in module.nexus_repository_raw_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Rubygems Group
################################################################################
output "repository_rubygems_group" {
  description = "Repository Rubygems Group."
  value = [
    for r in module.nexus_repository_rubygems_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Rubygems Hosted
################################################################################
output "repository_rubygems_hosted" {
  description = "Repository Rubygems Hosted."
  value = [
    for r in module.nexus_repository_rubygems_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Rubygems Proxy
################################################################################
output "repository_rubygems_proxy" {
  description = "Repository Rubygems Proxy."
  value = [
    for r in module.nexus_repository_rubygems_proxy : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Yum Group
################################################################################
output "repository_yum_group" {
  description = "Repository Yum Group."
  value = [
    for r in module.nexus_repository_yum_group : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Yum Hosted
################################################################################
output "repository_yum_hosted" {
  description = "Repository Yum Hosted."
  value = [
    for r in module.nexus_repository_yum_hosted : {
      name = r.name
    }
  ]
}

################################################################################
# Repository Yum Proxy
################################################################################
output "repository_yum_proxy" {
  description = "Repository Yum Proxy."
  value = [
    for r in module.nexus_repository_yum_proxy : {
      name = r.name
    }
  ]
}
