########## Required variables

variable "management_groups" {
  description = "(Required) Gets the map of management groups and attached subscriptions"
  type = object({
    root_mg_id = string # Root management group ID
    level1_child_mg = map(object({
      display_name     = string                 # A friendly name for this Management Group
      name             = string                 # The name of the Management Group, which needs to be unique across your tenant
      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group

    }))
    level2_child_mg = optional(map(object({
      display_name     = string                 # A friendly name for this Management Group
      name             = string                 # The name of the Management Group, which needs to be unique across your tenant
      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group
      parent_key       = string                 # The Key of the Parent Management Group in Level 1
    })))
    level3_child_mg = optional(map(object({
      display_name     = string                 # A friendly name for this Management Group
      name             = string                 # The name of the Management Group, which needs to be unique across your tenant
      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group
      parent_key       = string                 # The Key of the Parent Management Group in Level 2
    })))
    level4_child_mg = optional(map(object({
      display_name     = string                 # A friendly name for this Management Group
      name             = string                 # The name of the Management Group, which needs to be unique across your tenant
      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group
      parent_key       = string                 # The Key of the Parent Management Group in Level 3
    })))
    level5_child_mg = optional(map(object({
      display_name     = string                 # A friendly name for this Management Group
      name             = string                 # The name of the Management Group, which needs to be unique across your tenant
      subscription_ids = optional(list(string)) # A list of Subscription GUIDs which should be assigned to the Management Group
      parent_key       = string                 # The Key of the Parent Management Group in Level 4
    })))
  })
}
