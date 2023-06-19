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
