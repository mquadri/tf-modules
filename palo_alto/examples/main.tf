module "palo_alto" {
  source         = "../"
  firewall       = var.firewall
  routing_intent = var.routing_intent
  nva            = var.nva
}