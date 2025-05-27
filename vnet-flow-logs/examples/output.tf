output "flow_logs_output" {
  description = "Flow log resource details from the module."
  value       = module.vnet-logs.flow_logs_output
}
