output "groups" {
  value       = aws_identitystore_group.default
  description = "The created groups within Identity Store."
}

output "memberships" {
  value       = aws_identitystore_group_membership.default
  description = "The created group memberships within Identity Store."
}
