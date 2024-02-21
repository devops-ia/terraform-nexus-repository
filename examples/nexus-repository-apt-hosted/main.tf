provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository Apt Hosted
################################################################################
module "nexus_repository_apt_hosted" {
  source = "../../modules/nexus-repository-apt-hosted"

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
