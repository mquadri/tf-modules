variable "owners" {
  description = " set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals. By default, the principal being used to execute Terraform is assigned as the sole owner. Groups cannot be created with no owners or have all their owners removed."
  default     = null
}

variable "members" {
  description = "A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block"
  default     = null
}

variable "security_enabled" {
  description = "Whether the group is a security group for controlling access to in-app resources. Defaults to true."
  default     = true
}

#variable "types" {
#  description = "A set of group types to configure for the group. Supported values are DynamicMembership, which denotes a group with dynamic membership. Defaults to null/standard group."
#  default     = null
#}

variable "group_name" {
  description = "The display name for the group."
}

#variable "dynamic_membership_rule" {
# description = "Dynamic membership rules to configure for the group. Supported values are All, which denotes a group with dynamic membership based on all users in the tenant or filter on a user property. Example user.department -eq \"Sales\""
# default     = null
#}
