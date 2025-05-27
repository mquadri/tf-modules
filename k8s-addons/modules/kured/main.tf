data "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = var.cluster_name
  resource_group_name = var.cluster_rg
}

resource "kubernetes_namespace" "kurednamespace" {
  metadata {
    name = var.kured_namespace
    labels = {
      application              = var.kured_namespace_labels.application-lbl
      environment              = var.kured_namespace_labels.environment-lbl
      ns-contact-name          = var.kured_namespace_labels.ns-contact-name-lbl
      ns-contact-ad-group-name = var.kured_namespace_labels.ns-contact-ad-group-name-lbl
      type                     = "addon"
    }
  }
}

resource "kubernetes_secret" "kuredsecret" {
  metadata {
    name      = var.imgpullsecret
    namespace = var.kured_namespace
  }

  data = {
    ".dockerconfigjson" = <<DOCKER
  {

  "auths" = {
    "${var.registry_server}": {
        "auth": "${base64encode("${var.registry_username}:${var.registry_secret}")}"
    }
  }
}
DOCKER
  }

  type = "kubernetes.io/dockerconfigjson"

  depends_on = [kubernetes_namespace.kurednamespace]
}

resource "helm_release" "kured" {
  name      = "kured"
  chart     = "${path.module}/kured"
  namespace = var.kured_namespace
  values    = [file("${path.module}/helm-values/kured-helm-values.yaml")]

  set {
    name  = "image.repostiory"
    value = var.kured_imgrepository
  }

  set {
    name  = "image.tag"
    value = var.kured_imgtag
  }

  set {
    name  = "image.pullSecrets[0].name"
    value = var.imgpullsecret
  }

  set {
    name  = "image.pullpolicy"
    value = var.kured_imgpullpolicy
  }

  set {
    name  = "configuration.timeZone"
    value = var.kured_timezone
  }

  set {
    name  = "configuration.startTime"
    value = var.kured_starttime
  }

  set {
    name  = "configuration.endTime"
    value = var.kured_endtime
  }

  set {
    name  = "configuration.period"
    value = var.kured_period
  }

  set {
    name  = "configuration.rebootDays"
    value = "{${join(",", var.kured_rebootdays)}}"
  }

  depends_on = [kubernetes_secret.kuredsecret]
}