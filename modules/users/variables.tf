variable "users" {
  type        = list(any)
  description = <<EOF
  List of users to create, email, user_name, given_name, and family_name are the required fields.
  Supports the following attributes, fields with exclamation mark are required when used:
{
    email: string!,
    user_name: string!,
    given_name: string!,
    family_name: string!,
    middle_name: string,
    display_name: string,
    locale: string,
    nickname: string,
    preferred_language: string,
    timezone: string,
    title: string,
    user_type: string,
    phone_numbers: [
        {
            value: string!,
            primary: bool,
            type: string
        }
    ],
    addresses: [
        {
            street_address: string!,
            country: string,
            formatted: string,
            locality: string,
            postal_code: string,
            primary: bool,
            region: string,
            type: string
        }
    ]
}
EOF
}
