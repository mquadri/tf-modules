output "bastion_host" {
  description = "The name of the bastion host resource"
  value       = module.example-bastion.bastion_host
}

output "bastion_host_id" {
  description = "The id of the bastion host resource"
  value       = module.example-bastion.bastion_host_id
}