locals {
  default_naming = "${var.resourcetype}-${var.appname}-${var.env}${var.location == "" ? "" : format("%s-%s", "", var.location)}-${var.additionalcontext}"
  name           = var.name == null ? "" : var.name
  naming         = length(local.name) > 5 ? local.name : local.default_naming
}
