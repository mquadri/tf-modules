module "new-app-subnet" {
  source                      = "../"
  new_subnet                  = var.new_subnet
  nsg_association             = var.nsg_association
  application_resource_groups = var.application_resource_groups
}
