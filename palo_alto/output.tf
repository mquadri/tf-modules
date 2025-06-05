output "deployment_summary" {
  description = "Summary of deployed Palo Alto resources, including NVAs, Firewalls, and Routing Intents with Policies"
  value = {
    nv_as = {
      for key, appliance in azurerm_palo_alto_virtual_network_appliance.appliance : key => {
        name = appliance.name
      }
    }

    firewalls = {
      for key, fw in azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama.palo_fw : key => {
        name                = fw.name
        resource_group_name = fw.resource_group_name
        location            = fw.location
      }
    }

    routing_intents = {
      for intent_key, intent in azurerm_virtual_hub_routing_intent.routing_intent : intent_key => {
        name = intent.name
        policies = [
          for policy in intent.routing_policy : {
            policy_name = policy.name
          }
        ]
      }
    }
  }
}
