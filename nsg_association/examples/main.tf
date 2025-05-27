module "nsg-association" {
  source          = "github.com/CenturyLink/tf-modules-azure//nsg-association?ref=4.7.0"
  nsg_association = var.nsg_association

}