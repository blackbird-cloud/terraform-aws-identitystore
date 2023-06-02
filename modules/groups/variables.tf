variable "groups" {
  type        = list(any)
  description = <<EOF
  List of groups to create, display_name is the required field, the members field should be populated with user ids.
  Supports the following attributes, fields with exclamation mark are required when used:
  {
    display_name: string!,
    description: string,
    members: [string]
  }
  EOF
}

