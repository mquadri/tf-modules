output "bastion_host" {
  value = module.avm-res-network-bastionhost.name
}

output "bastion_host_id" {
  value = module.avm-res-network-bastionhost.resource_id
}