locals {
  naming = "${var.resourcetype}-${var.appname}-${var.env}"

  identity_type = "SystemAssigned, UserAssigned"

  userIdentities = concat(var.userIdentities, [azurerm_user_assigned_identity.cmkid.id])

  cmk_expire_date = formatdate("YYYY-MM-DD'T'hh:mm:ssZ", timeadd(timestamp(), "17520h"))


  connection_string = var.connection_string != null ? var.connection_string : "Server=tcp:${var.sql_server_url},1433;Database=${var.sql_db_name};User ID=${var.sql_server_user}@${var.sql_server_name};Trusted_Connection=False;Encrypt=True;"

  # ------------------------------------------------------------
  #
  # 240514 - dns name: (removal of privatelink from fqdn)
  # https://learn.microsoft.com/en-us/azure/azure-sql/database/private-endpoint-overview?view=azuresql#check-connectivity-using-sql-server-management-studio-ssms
  #
  # Use the Fully Qualified Domain Name (FQDN) of the server in connection strings for your clients (<server>.database.windows.net). Any login attempts made directly to the IP address or using the private link FQDN (<server>.privatelink.database.windows.net) shall fail. This behavior is by design, since private endpoint routes traffic to the SQL Gateway in the region and the correct FQDN needs to be specified for logins to succeed.
  #
  mi_connection_string = var.mi_connection_string != null ? var.mi_connection_string : "data source=${var.sql_server_name}.database.windows.net;initial catalog=${var.sql_db_name};integrated security=False;encrypt=True;connection timeout=30"
  #
  # ------------------------------------------------------------

  tags = {
    appid               = var.appid
    appname             = var.appname
    resourcetype        = var.resourcetype
    costAppOwnerManager = var.costAppOwnerManager
    costAppOwnerTech    = var.costAppOwnerTech
    costBudgetOwner     = var.costBudgetOwner
    costCostCenter      = var.costCostCenter
    costDivision        = var.costDivision
    costRegion          = var.location
    costVP              = var.costVP
    environment         = var.env
    costAllocation      = var.costAllocation #(can only be sharedcosts or chargeback)
    appFunction         = var.appFunction
    monthlyBudget       = var.monthlyBudget
    costbaseline        = var.costbaseline #(year resource created)
    provisioned_by      = "Terraform"
    provisioned_date    = timestamp()
  }

  shir_dowload_file = basename(var.download_shir_uri)
}
