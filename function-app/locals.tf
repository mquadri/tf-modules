
locals {
  postName = "${var.malName}-${var.location}-${var.additionalcontext}"

  AppName                 = var.functionAppName != null ? var.functionAppName : "func-${local.postName}"
  AppPlanName             = var.functionPlanName != null ? var.functionPlanName : "func-plan-${local.postName}"
  applicationInsightsName = var.applicationInsightsName != null ? var.applicationInsightsName : "appi-${local.postName}"
  storageContainerName    = var.storageContainerName != null ? var.storageContainerName : "deploymentpackage"
  diagnosticsName         = var.diagnosticsName != null ? var.diagnosticsName : "diag-${local.postName}"
}
