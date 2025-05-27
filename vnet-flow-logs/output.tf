output "flow_logs_output" {
  description = "Flow log resource details from the module."
  value = {
    for k, v in module.avm-res-network-networkwatcher : k => v.resource_flow_log
  }
}