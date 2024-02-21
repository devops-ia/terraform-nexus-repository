################################################################################
# Pypi Group
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

variable "group" {
  description = "Configuration for repository group"
  type = object({
    member_names = set(string)
  })
}

variable "storage" {
  description = "The storage configuration of the repository"
  type = object({
    blob_store_name                = string
    strict_content_type_validation = optional(bool)
  })
}
