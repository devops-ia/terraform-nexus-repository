provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Repository R Group
################################################################################
module "nexus_repository_r_group" {
  source = "../../modules/nexus-repository-r-group"

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
