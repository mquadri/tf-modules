variable "anf_netapp" {
  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    active_directories = optional(map(object({
      adds_domain                       = string
      dns_servers                       = set(string)
      adds_site_name                    = string
      adds_admin_user_name              = string
      adds_admin_password               = string
      smb_server_name                   = string
      adds_ou                           = optional(string, "CN=Computers")
      kerberos_ad_server_name           = optional(string)
      kerberos_kdc_ip                   = optional(string)
      aes_encryption_enabled            = optional(bool, false)
      local_nfs_users_with_ldap_allowed = optional(bool, false)
      ldap_over_tls_enabled             = optional(bool, false)
      server_root_ca_certificate        = optional(string)
      ldap_signing_enabled              = optional(bool, false)
      administrators                    = optional(set(string))
      backup_operators                  = optional(set(string))
      security_operators                = optional(set(string))
      ldap_search_scope = optional(object({
        user_dn                 = string
        group_dn                = string
        group_membership_filter = optional(string)
      }))
    })), {})

    backup_policies = optional(map(object({
      name                    = string
      tags                    = optional(map(string))
      enabled                 = optional(bool, true)
      daily_backups_to_keep   = optional(number, 2)
      weekly_backups_to_keep  = optional(number, 1)
      monthly_backups_to_keep = optional(number, 1)
    })), {})

    backup_vaults = optional(map(object({
      name = string
      tags = optional(map(string))
    })), {})

    capacity_pools = optional(map(object({
      name            = string
      cool_access     = optional(bool, false)
      encryption_type = optional(string, "Single")
      size            = number
      qos_type        = optional(string, "Auto")
      service_level   = optional(string)
      tags            = optional(map(string), null)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
      role_assignments = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })))
    })), {})

    customer_managed_key = optional(object({
      key_vault_resource_id = string
      key_name              = string
      key_version           = optional(string)
      key_source            = optional(string)
      user_assigned_identity = optional(object({
        resource_id = string
      }))
    }), null)

    enable_telemetry = optional(bool, false)

    inherit_tags_from_parent_resource = optional(bool, false)

    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)

    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})

    role_assignments = optional(map(object({
      role_definition_id                     = string
      principal_id                           = string
      principal_type                         = string
      description                            = optional(string)
      condition                              = optional(string)
      condition_version                      = optional(string)
      delegated_managed_identity_resource_id = optional(string)
    })), {})

    snapshot_policies = optional(map(object({
      name    = string
      tags    = optional(map(string))
      enabled = optional(bool, true)
      hourly_schedule = optional(object({
        snapshots_to_keep = number
        minute            = number
      }))
      daily_schedule = optional(object({
        snapshots_to_keep = number
        hour              = number
        minute            = number
      }))
      weekly_schedule = optional(object({
        snapshots_to_keep = number
        day               = set(string)
        minute            = number
        hour              = number
      }))
      monthly_schedule = optional(object({
        snapshots_to_keep = number
        days_of_month     = set(number)
        hour              = number
        minute            = number
      }))
    })), {})

    subscription_id = optional(string)

    tags = optional(map(string))

    volumes = optional(map(object({
      name                         = string
      capacity_pool_map_key        = string
      subnet_resource_id           = string
      tags                         = optional(map(string))
      avs_data_store               = optional(bool)
      backup_policy_map_key        = optional(string)
      backup_vault_map_key         = optional(string)
      backup_policy_enforced       = optional(bool)
      cool_access                  = optional(bool, false)
      cool_access_retrieval_policy = optional(string)
      coolness_period              = optional(number)
      creation_token               = optional(string)
      default_quota_enabled        = optional(bool, false)
      default_group_quota_in_kibs  = optional(number, 0)
      default_user_quota_in_kibs   = optional(number, 0)
      delete_base_snapshot         = optional(bool)
      enable_sub_volumes           = optional(bool)
      encryption_key_source        = optional(string, "Microsoft.NetApp")
      export_policy_rules = optional(map(object({
        rule_index      = number
        allowed_clients = list(string)
        chown_mode      = optional(string)
        cifs            = optional(bool)
        nfsv3           = optional(bool)
        nfsv41          = optional(bool)
        has_root_access = optional(bool)
        kerberos5i_ro   = optional(bool)
        kerberos5i_rw   = optional(bool)
        kerberos5p_ro   = optional(bool)
        kerberos5p_rw   = optional(bool)
        kerberos5_ro    = optional(bool)
        kerberos5_rw    = optional(bool)
        unix_ro         = optional(bool)
        unix_rw         = optional(bool)
      })))
      key_vault_private_endpoint_resource_id = optional(string)
      is_large_volume                        = optional(bool, false)
      kerberos_enabled                       = optional(bool, false)
      ldap_enabled                           = optional(bool, false)
      network_features                       = optional(string, "Standard")
      protocol_types                         = optional(set(string), ["NFSv3"])
      proximity_placement_group_resource_id  = optional(string)
      security_style                         = optional(string)
      service_level                          = optional(string, "Standard")
      smb_access_based_enumeration_enabled   = optional(bool)
      smb_continuously_available             = optional(bool, false)
      smb_encryption                         = optional(bool, false)
      smb_non_browsable                      = optional(bool)
      snapshot_directory_visible             = optional(bool, true)
      snapshot_policy_map_key                = optional(string)
      throughput_mibps                       = optional(number)
      unix_permissions                       = optional(string, "0770")
      volume_size_in_gib                     = optional(number, 50)
      volume_spec_name                       = optional(string)
      volume_type                            = optional(string, "")
      zone                                   = optional(number)
    })), {})

  }))
}

# tags

variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}