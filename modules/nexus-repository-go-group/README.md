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
| [nexus_repository_go_group.main](https://registry.terraform.io/providers/datadrivers/nexus/latest/docs/resources/repository_go_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group"></a> [group](#input\_group) | Configuration for repository group | <pre>object({<br>    member_names = set(string)<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A unique identifier for this repository | `string` | n/a | yes |
| <a name="input_online"></a> [online](#input\_online) | Whether this repository accepts incoming requests | `bool` | `null` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | The storage configuration of the repository | <pre>object({<br>    blob_store_name                = string<br>    strict_content_type_validation = optional(bool)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the resource. |
