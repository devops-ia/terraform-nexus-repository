## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_nexus"></a> [nexus](#requirement\_nexus) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nexus"></a> [nexus](#provider\_nexus) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nexus_repository_conda_proxy.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/repository_conda_proxy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cleanup"></a> [cleanup](#input\_cleanup) | Cleanup policies | <pre>object({<br>    policy_names = optional(set(string))<br>  })</pre> | `null` | no |
| <a name="input_http_client"></a> [http\_client](#input\_http\_client) | HTTP Client configuration for proxy repositories | <pre>object({<br>    blocked    = bool<br>    auto_block = bool<br>    connection = optional(object({<br>      retries                   = optional(number)<br>      user_agent_suffix         = optional(string)<br>      timeout                   = optional(number)<br>      enable_circular_redirects = optional(bool)<br>      enable_cookies            = optional(bool)<br>      use_trust_store           = optional(bool)<br>    }))<br>    authentication = optional(object({<br>      type        = string<br>      username    = optional(string)<br>      password    = optional(string)<br>      ntlm_host   = optional(string)<br>      ntlm_domain = optional(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A unique identifier for this repository | `string` | n/a | yes |
| <a name="input_negative_cache"></a> [negative\_cache](#input\_negative\_cache) | Configuration of the negative cache handling | <pre>object({<br>    enabled = optional(bool)<br>    ttl     = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_online"></a> [online](#input\_online) | Whether this repository accepts incoming requests | `bool` | `null` | no |
| <a name="input_proxy"></a> [proxy](#input\_proxy) | Configuration for the proxy repository | <pre>object({<br>    remote_url       = string<br>    content_max_age  = optional(number)<br>    metadata_max_age = optional(number)<br>  })</pre> | n/a | yes |
| <a name="input_routing_rule"></a> [routing\_rule](#input\_routing\_rule) | The name of the routing rule assigned to this repository. | `string` | `""` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | The storage configuration of the repository | <pre>object({<br>    blob_store_name                = string<br>    strict_content_type_validation = optional(bool)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the resource. |
