storage_sync_services = {
  sync1 = {
    resource_group_name = "ex1"
    location            = "East US"
    tags = {
      environment = "dev"
      owner       = "team-ops"
    }
  }
  sync2 = {
    resource_group_name = "ex2"
    location            = "East US"
    tags = {
      environment = "dev"
      owner       = "team-ops"
    }
  }
}

storage_sync_groups = {
  "sync_group_1" = {
    name              = "sync_group_1"
    storage_sync_name = "sync1"
  }
  "sync_group_2" = {
    name              = "sync_group_2"
    storage_sync_name = "sync2"
  }
}