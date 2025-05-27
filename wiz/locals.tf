locals {
  application_roles = ["Directory.Read.All", "Policy.Read.All", "RoleManagement.Read.All", "AccessReview.Read.All", "AuditLog.Read.All"]
}


locals {
  management_group_id = "/providers/Microsoft.Management/managementGroups/${var.azure_management_group_id}"
  subscription_id     = "/subscriptions/${var.azure_subscription_id}"

  scope        = try(coalesce(var.azure_management_group_id != "" ? local.management_group_id : null, var.azure_subscription_id != "" ? local.subscription_id : null), "")
  scope_exists = length(local.scope) > 0

  entra_id_scanning = var.enable_entra_id_scanning

  custom_role_actions_base = [
    "Microsoft.Compute/disks/beginGetAccess/action",
    "Microsoft.Compute/snapshots/beginGetAccess/action",
    "Microsoft.Compute/snapshots/delete",
    "Microsoft.Compute/snapshots/endGetAccess/action",
    "Microsoft.Compute/snapshots/read",
    "Microsoft.Compute/snapshots/write",
    "Microsoft.Compute/galleries/images/versions/read",
    "Microsoft.Web/sites/config/list/action",
    "Microsoft.Web/sites/slots/config/list/action",
    "Microsoft.DataFactory/factories/querydataflowdebugsessions/action",
    "Microsoft.ContainerRegistry/registries/webhooks/listEvents/action",
    "Microsoft.ContainerRegistry/registries/webhooks/getCallbackConfig/action",
    "Microsoft.HDInsight/clusters/read"
  ]

  custom_role_actions_data_scanning = var.enable_data_scanning ? [
    "Microsoft.Sql/servers/read",
    "Microsoft.Sql/servers/databases/write",
    "Microsoft.Sql/servers/databases/read"
  ] : []

  custom_role_actions_serverless_scanning = var.enable_serverless_scanning ? [
    "Microsoft.Web/hostingenvironments/sites/read",
    "Microsoft.Web/serverfarms/sites/read",
    "Microsoft.Web/sites/backup/action",
    "Microsoft.Web/sites/backup/read",
    "Microsoft.Web/sites/backups/delete",
    "Microsoft.Web/sites/backups/list/action",
    "Microsoft.Web/sites/backups/read",
    "Microsoft.Web/sites/config/list/action",
    "Microsoft.Web/sites/config/read",
    "Microsoft.Web/sites/config/snapshots/read",
    "Microsoft.Web/sites/extensions/*/action",
    "Microsoft.Web/sites/extensions/*/read",
    "Microsoft.Web/sites/functions/*/read",
    "Microsoft.Web/sites/functions/read",
    "Microsoft.Web/sites/host/listkeys/action",
    "Microsoft.Web/sites/hostruntime/*/read",
    "Microsoft.Web/sites/instances/read",
    "Microsoft.Web/sites/listbackups/action",
    "Microsoft.Web/sites/operationresults/read",
    "Microsoft.Web/sites/operations/read",
    "Microsoft.Web/sites/publish/action",
    "Microsoft.Web/sites/publishxml/action",
    "Microsoft.Web/sites/read",
    "Microsoft.Web/sites/slots/backup/action",
    "Microsoft.Web/sites/slots/backup/read",
    "Microsoft.Web/sites/slots/backups/delete",
    "Microsoft.Web/sites/slots/backups/list/action",
    "Microsoft.Web/sites/slots/backups/read",
    "Microsoft.Web/sites/slots/config/list/action",
    "Microsoft.Web/sites/slots/config/read",
    "Microsoft.Web/sites/slots/config/snapshots/read",
    "Microsoft.Web/sites/slots/extensions/*/action",
    "Microsoft.Web/sites/slots/extensions/*/read",
    "Microsoft.Web/sites/slots/functions/*/read",
    "Microsoft.Web/sites/slots/functions/read",
    "Microsoft.Web/sites/slots/host/listkeys/action",
    "Microsoft.Web/sites/slots/instances/read",
    "Microsoft.Web/sites/slots/listbackups/action",
    "Microsoft.Web/sites/slots/operationresults/read",
    "Microsoft.Web/sites/slots/operations/read",
    "Microsoft.Web/sites/slots/publish/action",
    "Microsoft.Web/sites/slots/publishxml/action",
    "Microsoft.Web/sites/slots/read",
    "Microsoft.Web/sites/slots/snapshots/read",
    "Microsoft.Web/sites/snapshots/read",
    "Microsoft.Web/staticSites/functions/read",
    "Microsoft.Web/staticSites/read",
    "Microsoft.Web/staticSites/userProvidedFunctionApps/read"
  ] : []
}
