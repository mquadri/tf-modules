locals {
  aks_role_assigments = {
    rbac_aks_cluster_admin = {
      role_definition   = "aks_cluster_admin"
      groups            = ["aks_cluster_admin_group"]
      app_registrations = ["ccoe-spn", "pe-aks-spn"]
    }
    rbac_aks_cluster_user = {
      role_definition   = "aks_cluster_user"
      groups            = ["aks_cluster_user_group"]
      app_registrations = ["ccoe-spn", "pe-aks-spn"]
    }
    rbac_aks_rbac_cluster_admin = {
      role_definition = "aks_rbac_cluster_admin"
      groups          = ["aks_rbac_admin_group"]
    }
    rbac_aks_rbac_admin = {
      role_definition   = "aks_rbac_admin"
      groups            = ["aks_rbac_admin_group"]
      app_registrations = ["ccoe-spn", "pe-aks-spn"]
    }
    rbac_aks_rbac_reader = {
      role_definition = "aks_rbac_reader"
      groups          = ["aks_rbac_reader_group"]
    }
    rbac_aks_rbac_writer = {
      role_definition = "aks_rbac_writer"
      groups          = ["aks_rbac_writer_group"]
    }
    rbac-lumen-aks-rancher = {
      role_definition   = "lumen_aks"
      app_registrations = ["pe-aks-spn"]
    }
  }
}


module "avm-roleassignment" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "0.1.0"

  role_definitions = {
    aks_cluster_admin = {
      name = "Azure Kubernetes Service Cluster Admin Role"
    }
    aks_cluster_user = {
      name = "Azure Kubernetes Service Cluster User Role"
    }
    aks_rbac_cluster_admin = {
      name = "Azure Kubernetes Service RBAC Cluster Admin"
    }
    aks_rbac_admin = {
      name = "Azure Kubernetes Service RBAC Admin"
    }
    aks_rbac_reader = {
      name = "Azure Kubernetes Service RBAC Reader"
    }
    aks_rbac_writer = {
      name = "Azure Kubernetes Service RBAC Writer"
    }
    lumen_aks = {
      name  = "Lumen-AKS-Rancher-Role"
      scope = "/subscriptions/1c36754f-c4af-4fbf-9547-40bad3921d47"
    }

  }
  groups_by_display_name = {
    aks_cluster_admin_group = var.aks_cluster_admin_group
    aks_cluster_user_group  = var.aks_cluster_user_group
    aks_rbac_admin_group    = var.aks_rbac_admin_group
    aks_rbac_reader_group   = var.aks_rbac_reader_group
    aks_rbac_writer_group   = var.aks_rbac_writer_group
  }

  app_registrations_by_display_name = {
    ccoe-spn   = "spn-acf-prod-pci-terraform-automation"
    pe-aks-spn = "CCOE-AKS-Rancher"
  }

  role_assignments_for_scopes = {
    aks = {
      scope            = jsondecode(module.aks.aks_arm.output).properties.outputs.resourceId.value
      role_assignments = local.aks_role_assigments
    }
    aks-svcs = {
      scope            = jsondecode(module.aks-svcs.aks_arm.output).properties.outputs.resourceId.value
      role_assignments = local.aks_role_assigments
    }

    aks-wklds-eastus2 = {
      scope            = jsondecode(module.aks-wklds-eastus2.aks_arm.output).properties.outputs.resourceId.value
      role_assignments = local.aks_role_assigments
    }

    aks-svcs-eastus2 = {
      scope            = jsondecode(module.aks-svcs-eastus2.aks_arm.output).properties.outputs.resourceId.value
      role_assignments = local.aks_role_assigments
    }
    aks-mgmt = {
      scope            = jsondecode(module.aks-mgmt.aks_arm.output).properties.outputs.resourceId.value
      role_assignments = local.aks_role_assigments
    }
  }
}