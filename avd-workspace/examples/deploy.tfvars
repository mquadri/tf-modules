workspaces = {
  "workspace_scenario_1" = {
    virtual_desktop_workspace_name                = "workspace-1"
    virtual_desktop_workspace_resource_group_name = "test1313"
    virtual_desktop_workspace_location            = "East US"
    resource_group_name                           = "test1313"
    workspaces_appgroup_association = [
      {
        appgroup_name                = "test-hostpool-01-DAG"
        appgroup_resource_group_name = "nonprod-01"
      },
      {
        appgroup_name                = "test-hostpool-01-DAG"
        appgroup_resource_group_name = "new1313"
      }
    ]
    tags = {
      environment = "production"
      owner       = "team1"
    }
  }

  "workspace_scenario_2" = {
    virtual_desktop_workspace_name                = "workspace-2"
    virtual_desktop_workspace_resource_group_name = "test1313"
    virtual_desktop_workspace_location            = "East US"
    resource_group_name                           = "test1313"
    workspaces_appgroup_association = [
      {
        appgroup_name                = "test-hostpool-02-DAG"
        appgroup_resource_group_name = "test1313"
      }
    ]
    virtual_desktop_workspace_tags = {
      environment = "development"
      owner       = "team2"
    }
  }

  "workspace_scenario_3" = {
    virtual_desktop_workspace_name                = "workspace-3"
    virtual_desktop_workspace_resource_group_name = "nonprod-01"
    virtual_desktop_workspace_location            = "East US"
    resource_group_name                           = "nonprod-01"
    workspaces_appgroup_association               = []
    tags = {
      environment = "staging"
      owner       = "team3"
    }
  }
}