locals {
  default_name = "azu-vnet-${var.appname}-${local.environment}-${var.location}-${var.additionalcontext}"
  var_name     = var.name == null ? "" : var.name
  name         = length(local.var_name) > 5 ? local.var_name : local.default_name

  environment = var.environment != null ? var.environment : var.env != null ? var.env : null

  migration = var.msftmigration != null ? var.msftmigration : var.migration != null ? var.migration : null

  mandatory_tags = tomap({
    app_id      = var.app_id
    migration   = local.migration
    environment = lower(local.environment)
  })

  all_dns_servers = tomap({
    "eastus2"        = toset(["148.155.136.100", "148.155.136.101"])
    "centralus"      = toset(["148.155.136.164", "148.155.136.165"])
    "westcentralus"  = toset(["8.30.135.252", "8.30.135.253"])
    "northcentralus" = toset(["8.30.143.252", "8.30.143.254"])
    "vhub"           = toset(["10.120.10.68", "10.121.10.68", "151.117.23.4", "151.116.17.28"])
    "eip"            = toset(["151.117.23.4", "151.116.17.28"])
  })

  dns_servers = var.dns_servers != null ? setunion(var.dns_servers, local.all_dns_servers["eip"]) : var.virtual_hub_id != null ? local.all_dns_servers["vhub"] : local.all_dns_servers[lower(var.location)] != null ? local.all_dns_servers[lower(var.location)] : null

}