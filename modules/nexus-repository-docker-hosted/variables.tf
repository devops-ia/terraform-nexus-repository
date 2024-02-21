################################################################################
# Docker Hosted
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

variable "storage" {
  description = "The storage configuration of the repository"
  type = object({
    blob_store_name                = string
    strict_content_type_validation = bool
    write_policy                   = optional(string)
  })
}

variable "cleanup" {
  description = "Cleanup policies"
  type = object({
    policy_names = optional(set(string))
  })
  default = null
}

variable "component" {
  description = "Component configuration for the hosted repository"
  type = object({
    proprietary_components = bool
  })
  default = null
}
