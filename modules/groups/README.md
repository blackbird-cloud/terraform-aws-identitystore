## Groups
A Terraform module which helps you create groups for your your AWS Identitystore. Read [this](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html) page for more information.



### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

### Resources

| Name | Type |
|------|------|
| [aws_identitystore_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group) | resource |
| [aws_identitystore_group_membership.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_group_membership) | resource |
| [aws_ssoadmin_instances.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | List of groups to create, display\_name is the required field, the members field should be populated with user ids.<br>  Supports the following attributes, fields with exclamation mark are required when used:<br>  {<br>    display\_name: string!,<br>    description: string,<br>    members: [string]<br>  } | `list(any)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_groups"></a> [groups](#output\_groups) | The created groups within Identity Store. |
| <a name="output_memberships"></a> [memberships](#output\_memberships) | The created group memberships within Identity Store. |

