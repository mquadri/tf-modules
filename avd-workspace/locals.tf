
locals {
  workspace_app_association = flatten([
    for key, value in var.workspaces : [
      for v in coalesce(value.workspaces_appgroup_association, []) : {
        virtual_desktop_workspace_name                = value.virtual_desktop_workspace_name
        virtual_desktop_workspace_resource_group_name = value.virtual_desktop_workspace_resource_group_name
        appgroup_name                                 = v.appgroup_name
        appgroup_resource_group_name                  = v.appgroup_resource_group_name
      }
    ]
  ])

  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

