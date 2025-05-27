output "application_group_id" {
  description = "The ID of the application group."
  value       = { for a, ag in module.avm-ptn-avd-lza-managementplane : a => ag.application_group_id }
}

output "hostpool_id" {
  description = "The ID of the host pool."
  value       = { for h, hp in module.avm-ptn-avd-lza-managementplane : h => hp.hostpool_id }

}

output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  value       = { for la, law in module.avm-ptn-avd-lza-managementplane : la => law.log_analytics_workspace_id }
}

output "registrationinfo_token" {
  description = "The token for the host pool registration."
  sensitive   = true
  value       = { for t, token in module.avm-ptn-avd-lza-managementplane : t => token.registrationinfo_token }
}

output "resource" {
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
  value       = { for r, resource in module.avm-ptn-avd-lza-managementplane : r => resource.resource_id }
}

output "resource_id" {
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
  value       = { for r, resource in module.avm-ptn-avd-lza-managementplane : r => resource.resource_id.id }
}

output "scaling_plan_id" {
  description = "The ID of the scaling plan."
  value       = { for s, sp in module.avm-ptn-avd-lza-managementplane : s => sp.scaling_plan_id }
}

output "workspace_id" {
  description = "The ID of the workspace."
  value       = { for w, ws in module.avm-ptn-avd-lza-managementplane : w => ws.workspace_id }
}
