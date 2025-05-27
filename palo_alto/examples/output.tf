output "palo_alto_deployment_summary" {
  description = "Summary of deployed Palo Alto resources, including NVAs, Firewalls, and Routing Intents with Policies"
  value       = module.palo_alto.deployment_summary
}
