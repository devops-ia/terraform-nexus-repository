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
| [nexus_repository_helm_hosted.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/repository_helm_hosted) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cleanup"></a> [cleanup](#input\_cleanup) | Cleanup policies | <pre>object({<br>    policy_names = optional(set(string))<br>  })</pre> | `null` | no |
| <a name="input_component"></a> [component](#input\_component) | Component configuration for the hosted repository | <pre>object({<br>    proprietary_components = bool<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique identifier for this repository | `string` | n/a | yes |
| <a name="input_online"></a> [online](#input\_online) | Whether this repository accepts incoming requests | `bool` | `null` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | The storage configuration of the repository | <pre>object({<br>    blob_store_name                = string<br>    strict_content_type_validation = bool<br>    write_policy                   = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the resource. |
