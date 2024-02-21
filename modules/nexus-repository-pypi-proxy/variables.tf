################################################################################
# Pypi Proxy
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

variable "routing_rule" {
  description = "The name of the routing rule assigned to this repository."
  type        = string
  default     = ""
}

variable "storage" {
  description = "The storage configuration of the repository"
  type = object({
    blob_store_name                = string
    strict_content_type_validation = optional(bool)
  })
}

variable "proxy" {
  description = "Configuration for the proxy repository"
  type = object({
    remote_url       = string
    content_max_age  = optional(number)
    metadata_max_age = optional(number)
  })
}

variable "negative_cache" {
  description = "Configuration of the negative cache handling"
  type = object({
    enabled = optional(bool)
    ttl     = optional(string)
  })
  default = null
}

variable "http_client" {
  description = "HTTP Client configuration for proxy repositories"
  type = object({
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
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_host   = optional(string)
      ntlm_domain = optional(string)
    }))
  })
}

variable "cleanup" {
  description = "Cleanup policies"
  type = object({
    policy_names = optional(set(string))
  })
  default = null
}
