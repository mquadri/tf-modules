module "reservation_order" {
  source = "../"

  resourcetype           = "ri"
  appname                = var.appname
  env                    = var.env
  location               = var.location
  billing_plan           = var.billing_plan
  display_name           = var.display_name
  quantity               = var.quantity
  renew                  = var.renew
  instance_flexibility   = var.instance_flexibility
  reserved_resource_type = var.reserved_resource_type
  term                   = var.term
  sku_name               = var.sku_name
  resource_group_name    = var.resource_group_name
  subscription_id        = var.subscription_id
}