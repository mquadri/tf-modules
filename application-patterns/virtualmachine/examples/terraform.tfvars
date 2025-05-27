vm_admin_pwd_keyvault_name = "testkvswvmtest"
machine_creds_akv_rg       = "vm-test-rg"
location                   = "eastus2"
vm_config = {
  "vm1" = {
    vm_name                            = "test-vm-1"
    additionalcontext                  = "01"
    resource_group_name                = "vm-test-rg"
    vm_size                            = "Standard_Ds1_v2"
    admin_username                     = "azureuser"
    availability_zone                  = 1
    computer_name                      = "testvm1"
    os_kernel_type                     = "windows"
    generate_admin_password_or_ssh_key = true
    identity_type                      = "SystemAssigned"
    tags = {
      app_id              = "app1"
      appFunction         = "test"
      appid               = "id1"
      appname             = "testapp"
      env                 = "dev"
      environment         = "DEV"
      costAllocation      = "test"
      costAppOwnerManager = "manager"
      costAppOwnerTech    = "mangaer2"
      costBudgetOwner     = "budgetowner"
      costbaseline        = "2023"
      costCenter          = "costcenter"
      costVP              = "vp"
      costDivision        = "division"
      monthlyBudget       = 1000
      managed_by          = "team"
      msftmigration       = "migration"
      os_support          = "true"
    }
    data_disk_config = {
      data_disk_enabled    = true
      disk_controller_type = "SCSI"
      data_disks = {
        "disk1" = {
          data_disk_name        = "test-vm-disk1"
          data_disk_size_gb     = 128
          data_disk_type        = "StandardSSD_LRS"
          data_disk_caching     = "None"
          data_disk_machine_lun = 0
        }
        "disk2" = {
          data_disk_name        = "test-vm-disk2"
          data_disk_size_gb     = 256
          data_disk_type        = "Standard_LRS"
          data_disk_caching     = "None"
          data_disk_machine_lun = 2
        }
      }
    }
    os_disk_config = {
      os_disk_name              = "test-vm-1-osdisk"
      os_disk_size_gb           = 128
      os_disk_type              = "Standard_LRS"
      os_disk_cache             = "ReadOnly"
      os_disk_write_accelerator = false
    }
    source_image_config = {
      offer     = "sql2022-ws2022"
      publisher = "microsoftsqlserver"
      sku       = "standard-gen2"
      version   = "latest"
    }
    network_interfaces = {
      "nic1" = {
        name = "test-vm-nic1"
        ip_configurations = {
          "ipconfig" = {
            name                          = "test-vm-ipconfig1"
            create_public_ip_address      = false
            public_ip_enabled             = false
            private_ip_subnet_resource_id = "/subscriptions/d425392c-c88d-4cc7-9212-06f029d44d0d/resourceGroups/vm-test-rg/providers/Microsoft.Network/virtualNetworks/azvmalertwintest001-vnet/subnets/default"
            public_ip_sku                 = "standard"
          }
        }
      }
    }
    vnet_name                = "azvmalertwintest001-vnet"
    subnet_name              = "default"
    vnet_resource_group_name = "vm-test-rg"
    auto_shutdown_config = {
      auto_shutdown_time     = "0000"
      auto_shutdown_timezone = "UTC"
    }
  }
  "vm2" = {
    vm_name                            = "test-vm-2"
    additionalcontext                  = "02"
    resource_group_name                = "vm-test-rg"
    vm_size                            = "Standard_Ds2_v2"
    admin_username                     = "vm2admin"
    availability_zone                  = 1
    computer_name                      = "testvm2"
    os_kernel_type                     = "windows"
    generate_admin_password_or_ssh_key = true
    identity_type                      = "userassigned"
    identity_ids                       = ["/subscriptions/d425392c-c88d-4cc7-9212-06f029d44d0d/resourceGroups/uai-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/test-policy-uai"]
    managed_identities = {
      user_assigned_resource_ids = [
        "/subscriptions/d425392c-c88d-4cc7-9212-06f029d44d0d/resourceGroups/uai-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/test-policy-uai"
      ]
    }
    tags = {
      app_id              = "app1"
      appFunction         = "test"
      appid               = "id1"
      appname             = "testapp"
      env                 = "dev"
      environment         = "DEV"
      costAllocation      = "test"
      costAppOwnerManager = "manager"
      costAppOwnerTech    = "mangaer2"
      costBudgetOwner     = "budgetowner"
      costbaseline        = "2023"
      costCenter          = "costcenter"
      costVP              = "vp"
      costDivision        = "division"
      monthlyBudget       = 1000
      managed_by          = "team"
      msftmigration       = "migration"
      os_support          = "true"
    }
    data_disk_config = {
      data_disk_enabled    = true
      disk_controller_type = "SCSI"
      data_disks = {
        "disk1" = {
          data_disk_name        = "test-vm-02-disk1"
          data_disk_size_gb     = 128
          data_disk_type        = "StandardSSD_LRS"
          data_disk_caching     = "None"
          data_disk_machine_lun = 0
        }
      }
    }
    os_disk_config = {
      os_disk_name              = "test-vm2-osdisk"
      os_disk_size_gb           = 128
      os_disk_type              = "Standard_LRS"
      os_disk_cache             = "ReadOnly"
      os_disk_write_accelerator = false
    }
    source_image_config = {
      offer     = "windowsServer"
      publisher = "MicrosoftWindowsServer"
      sku       = "2019-datacenter-gensecond"
      version   = "latest"
    }
    network_interfaces = {
      "nic1" = {
        name = "test-vm2-nic1"
        ip_configurations = {
          "ipconfig" = {
            name                          = "test-vm2-ipconfig1"
            create_public_ip_address      = false
            public_ip_enabled             = false
            private_ip_subnet_resource_id = "/subscriptions/d425392c-c88d-4cc7-9212-06f029d44d0d/resourceGroups/vm-test-rg/providers/Microsoft.Network/virtualNetworks/azvmalertwintest001-vnet/subnets/default"
            public_ip_sku                 = "Standard"
          }
        }
      }
    }
    vnet_name                = "azvmalertwintest001-vnet"
    subnet_name              = "default"
    vnet_resource_group_name = "vm-test-rg"
    auto_shutdown_config = {
      auto_shutdown_time     = "0020"
      auto_shutdown_timezone = "UTC"
    }
  }
}
