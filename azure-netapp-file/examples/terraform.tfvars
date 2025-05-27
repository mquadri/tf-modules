anf_netapp = {
  "netapp-1" = {
    name                = "anf-account-test"
    location            = "EastUS2"
    resource_group_name = "anf-test-rg"
    enable_telemetry    = true

    tags = {
      environment = "test"
    }

    capacity_pools = {
      "pool1" = {
        name          = "pool1"
        size          = 4398046511104
        service_level = "Standard"
        tags = {
          environment = "test"
        }
      }
      "pool2" = {
        name          = "pool2"
        size          = 4398046511104
        service_level = "Standard"
        qos_type      = "Manual"
        cool_access   = true
        tags = {
          environment = "test"
        }
      }
    }

    backup_vaults = {
      "backup-vault-1" = {
        name = "backup-vault-1"
        tags = {
          environment = "test"
        }
      }
      "backup-vault-2" = {
        name = "backup-vault-2"
        tags = {
          environment = "test"
        }
      }
    }

    backup_policies = {
      "backup-policy-1" = {
        name = "backup-policy-1"
        tags = {
          environment   = "test"
          configuration = "defaults"
        }
      }
      "backup-policy-2" = {
        name = "backup-policy-2"
        tags = {
          environment   = "test"
          configuration = "custom"
        }
        daily_backups_to_keep   = 7
        weekly_backups_to_keep  = 4
        monthly_backups_to_keep = 6
      }
    }

    snapshot_policies = {
      "snap-pol-1" = {
        name = "snap-pol-1"
        tags = {
          configuration = "all"
        }
        hourly_schedule = {
          snapshots_to_keep = 8
          minute            = 0
        }
        daily_schedule = {
          snapshots_to_keep = 7
          hour              = 0
          minute            = 0
        }
        weekly_schedule = {
          snapshots_to_keep = 2
          day               = ["Monday", "Friday"]
          minute            = 0
          hour              = 0
        }
        monthly_schedule = {
          snapshots_to_keep = 6
          days_of_month     = [1, 30]
          hour              = 0
          minute            = 0
        }
      }
      "snap-pol-2" = {
        name = "snap-pol-2"
        tags = {
          configuration = "daily only"
        }
        hourly_schedule = {
          snapshots_to_keep = 8
          minute            = 0
        }
        weekly_schedule = {
          snapshots_to_keep = 2
          day               = ["Monday", "Friday"]
          minute            = 0
          hour              = 0
        }
      }
    }

    volumes = {
      "volume-1" = {
        name = "volume-1"
        tags = {
          environment = "test"
        }
        capacity_pool_map_key = "pool1"
        subnet_resource_id    = ""
        service_level         = "Standard"
        export_policy_rules = {
          "rule1" = {
            rule_index      = 1
            allowed_clients = ["0.0.0.0/0"]
            chown_mode      = "Restricted"
            cifs            = false
            nfsv3           = true
            nfsv41          = false
            has_root_access = true
            kerberos5i_ro   = false
            kerberos5i_rw   = false
            kerberos5p_ro   = false
            kerberos5p_rw   = false
            kerberos5_ro    = false
            kerberos5_rw    = false
            unix_ro         = false
            unix_rw         = true
          }
        }
      }
    }

  }
}