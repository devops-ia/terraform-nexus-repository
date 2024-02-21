################################################################################
# Docker Group
################################################################################
variable "name" {
  description = "A unique identifier for this repository"
  type        = string
}

variable "online" {
  description = "Whether this repository accepts incoming requests"
  type        = bool
  default     = null
}

variable "docker" {
  description = "docker contains the configuration of the docker repository"
  type = object({
    force_basic_auth = bool
    http_port        = optional(number)
    https_port       = optional(number)
    v1_enabled       = bool
    subdomain        = optional(string)
  })
}

variable "group" {
  description = "Configuration for repository group"
  type = object({
    member_names    = set(string)
    writable_member = optional(string)
  })
}

variable "storage" {
  description = "The storage configuration of the repository"
  type = object({
    blob_store_name                = string
    strict_content_type_validation = optional(bool)
  })
}
