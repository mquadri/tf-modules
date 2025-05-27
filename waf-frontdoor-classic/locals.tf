locals {

  waf_mode = var.waf_mode != null ? var.waf_mode : "Prevention"

  rules_custom_p21 = var.rules_custom_p21 != null ? var.rules_custom_p21 : local.default_rules_custom_p21
  rules_custom_p22 = var.rules_custom_p22 != null ? var.rules_custom_p22 : local.default_rules_custom_p22
  rules_custom_p23 = var.rules_custom_p23 != null ? var.rules_custom_p23 : local.default_rules_custom_p23
  rules_custom_p24 = var.rules_custom_p24 != null ? var.rules_custom_p24 : local.default_rules_custom_p24
  rules_custom_p25 = var.rules_custom_p25 != null ? var.rules_custom_p25 : local.default_rules_custom_p25
  rules_custom_p26 = var.rules_custom_p26 != null ? var.rules_custom_p26 : local.default_rules_custom_p26
  rules_custom_p27 = var.rules_custom_p27 != null ? var.rules_custom_p27 : local.default_rules_custom_p27
  rules_custom_p28 = var.rules_custom_p28 != null ? var.rules_custom_p28 : local.default_rules_custom_p28
  rules_custom_p29 = var.rules_custom_p29 != null ? var.rules_custom_p29 : local.default_rules_custom_p29
  rules_custom_p30 = var.rules_custom_p30 != null ? var.rules_custom_p30 : local.default_rules_custom_p30
  rules_custom_p31 = var.rules_custom_p31 != null ? var.rules_custom_p31 : local.default_rules_custom_p31
  rules_custom_p32 = var.rules_custom_p32 != null ? var.rules_custom_p32 : local.default_rules_custom_p32
  rules_custom_p33 = var.rules_custom_p33 != null ? var.rules_custom_p33 : local.default_rules_custom_p33
  rules_custom_p34 = var.rules_custom_p34 != null ? var.rules_custom_p34 : local.default_rules_custom_p34
  rules_custom_p35 = var.rules_custom_p35 != null ? var.rules_custom_p35 : local.default_rules_custom_p35
  rules_custom_p36 = var.rules_custom_p36 != null ? var.rules_custom_p36 : local.default_rules_custom_p36


  rules_custom_ind = flatten([local.rules_custom_p21, local.rules_custom_p22, local.rules_custom_p23, local.rules_custom_p24, local.rules_custom_p25, local.rules_custom_p26, local.rules_custom_p27, local.rules_custom_p28, local.rules_custom_p29, local.rules_custom_p30, local.rules_custom_p31, local.rules_custom_p32, local.rules_custom_p33, local.rules_custom_p34, local.rules_custom_p35, local.rules_custom_p36, var.additional_custom_rules])

  rules_custom = local.rules_custom_ind
}
