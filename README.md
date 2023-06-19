# AWS Identitystore Terraform module
A Terraform module which helps you create users and groups for your your AWS Identitystore. Read [this](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html) page for more information.

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

## Example
```hcl
module "users" {
  source  = "blackbird-cloud/identitystore/aws//modules/users"
  version = "~> 1"
  users = [
    {
      email       = "john.doe@email.com"
      user_name   = "john.doe@email.com"
      given_name  = "John"
      family_name = "Doe"
    },
    {
      email       = "jane.doe@email.com"
      user_name   = "jane.doe@email.com"
      given_name  = "Jane"
      family_name = "doe"
    }
  ]
}

module "groups" {
  source  = "blackbird-cloud/identitystore/aws//modules/groups"
  version = "~> 1"
  groups = [
    {
      display_name = "Administrators"
      description  = "The Administrators group."
      members = [
        module.users.users["john.doe@email.com"].user_id,
        module.users.users["jane.doe@email.com"].user_id
      ]
    }
  ]
}
```
<!-- BEGIN_TF_DOCS -->
# AWS Identitystore Terraform module
A Terraform module which helps you create users and groups for your your AWS Identitystore. Read [this](https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html) page for more information.

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

## Example
```hcl
module "users" {
  source  = "blackbird-cloud/identitystore/aws//modules/users"
  version = "~> 1"
  users = [
    {
      email       = "john.doe@email.com"
      user_name   = "john.doe@email.com"
      given_name  = "John"
      family_name = "Doe"
    },
    {
      email       = "jane.doe@email.com"
      user_name   = "jane.doe@email.com"
      given_name  = "Jane"
      family_name = "doe"
    }
  ]
}

module "groups" {
  source  = "blackbird-cloud/identitystore/aws//modules/groups"
  version = "~> 1"
  groups = [
    {
      display_name = "Administrators"
      description  = "The Administrators group."
      members = [
        module.users.users["john.doe@email.com"].user_id,
        module.users.users["jane.doe@email.com"].user_id
      ]
    }
  ]
}
```
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
<!-- BEGIN_TF_DOCS -->
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
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5 |

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
<!-- END_TF_DOCS -->

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2023 [Blackbird Cloud](https://blackbird.cloud)
<!-- END_TF_DOCS -->

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

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2023 [Blackbird Cloud](https://blackbird.cloud)