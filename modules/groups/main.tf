data "aws_ssoadmin_instances" "default" {}

resource "aws_identitystore_group" "default" {
  for_each = {
    for group in var.groups : group.display_name => group
  }
  identity_store_id = tolist(data.aws_ssoadmin_instances.default.identity_store_ids)[0]


  display_name = each.value.display_name
  description  = try(each.value.description, null)
}

locals {
  group_members = flatten([
    for group in var.groups : [
      for member_id in group.members : {
        group_display_name : group.display_name
        member_id : member_id
      }
    ]
  ])
}

resource "aws_identitystore_group_membership" "default" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.default.identity_store_ids)[0]

  for_each = {
    for group_member in local.group_members : "${group_member.group_display_name}-${group_member.member_id}" => group_member
  }

  group_id  = aws_identitystore_group.default[each.value.group_display_name].group_id
  member_id = each.value.member_id
}
