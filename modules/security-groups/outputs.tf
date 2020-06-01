output security_group_name {
  value = var.security_group_name
}

output security_group_cidr_block {
  value = var.security_group_cidr_block
}

output security_group_role {
  value = var.security_group_role
}

output "id" {
  description = "The ID of the security group"
  value = concat(aws_security_group.this.*.id, [""])[0]
}
