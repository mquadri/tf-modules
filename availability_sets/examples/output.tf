output "all_availability_sets" {
  description = "A comprehensive map containing all the details of each Availability Set, indexed by availability set name."
  value = { for k, v in module.availability_sets.all_availability_sets : k => {
    name                = v.name
    location            = v.location
    resource_group_name = v.resource_group_name
  } }
}