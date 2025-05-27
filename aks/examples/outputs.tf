output "aks" {
  value = {
    aks-shared-wklds-nonprod-centralus-01 = module.aks
  }
  description = "values for  clusters"
}

output "akv" {
  value       = module.akv
  description = "values for akv"
}