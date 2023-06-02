data "aws_ssoadmin_instances" "default" {}

resource "aws_identitystore_user" "default" {
  for_each = {
    for user in var.users : user.email => user
  }

  identity_store_id = tolist(data.aws_ssoadmin_instances.default.identity_store_ids)[0]

  display_name       = try(each.value.display_name, each.value.email)
  user_name          = try(each.value.user_name, each.value.email)
  locale             = try(each.value.locale, null)
  nickname           = try(each.value.nickname, null)
  preferred_language = try(each.value.preferred_language, null)
  timezone           = try(each.value.timezone, null)
  title              = try(each.value.title, null)
  user_type          = try(each.value.user_type, null)

  name {
    given_name       = each.value.given_name
    family_name      = each.value.family_name
    middle_name      = each.value.middle_name
    honorific_prefix = each.value.honorific_prefix
    honorific_suffix = each.value.honorific_suffix
  }

  emails {
    value = each.value.email
  }

  dynamic "phone_numbers" {
    for_each = {
      for phone_number in try(each.value.phone_numbers, []) : phone_number.value => phone_number
    }
    content {
      primary = try(phone_numbers.value.primary, null)
      type    = try(phone_numbers.value.type, null)
      value   = phone_numbers.value.value
    }
  }

  dynamic "addresses" {
    for_each = {
      for address in try(each.value.addresses, []) : address.street_address => address
    }
    content {
      country        = try(addresses.value.country, null)
      formatted      = try(addresses.value.formatted, null)
      locality       = try(addresses.value.locality, null)
      postal_code    = try(addresses.value.postal_code, null)
      primary        = try(addresses.value.primary, null)
      region         = try(addresses.value.region, null)
      type           = try(addresses.value.type, null)
      street_address = addresses.value.street_address
    }
  }
}
