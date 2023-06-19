<!-- BEGIN_TF_DOCS -->
## Users
A Terraform module which helps you create users for your your AWS Identitystore. Read [this](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html) page for more information.

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5 |

### Resources

| Name | Type |
|------|------|
| [aws_identitystore_user.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/identitystore_user) | resource |
| [aws_ssoadmin_instances.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_users"></a> [users](#input\_users) | List of users to create, email, user\_name, given\_name, and family\_name are the required fields.<br>  Supports the following attributes, fields with exclamation mark are required when used:<br>{<br>    email: string!,<br>    user\_name: string!,<br>    given\_name: string!,<br>    family\_name: string!,<br>    middle\_name: string,<br>    display\_name: string,<br>    locale: string,<br>    nickname: string,<br>    preferred\_language: string,<br>    timezone: string,<br>    title: string,<br>    user\_type: string,<br>    phone\_numbers: [<br>        {<br>            value: string!,<br>            primary: bool,<br>            type: string<br>        }<br>    ],<br>    addresses: [<br>        {<br>            street\_address: string!,<br>            country: string,<br>            formatted: string,<br>            locality: string,<br>            postal\_code: string,<br>            primary: bool,<br>            region: string,<br>            type: string<br>        }<br>    ]<br>} | `list(any)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_users"></a> [users](#output\_users) | The created users within Identity Store. |
<!-- END_TF_DOCS -->