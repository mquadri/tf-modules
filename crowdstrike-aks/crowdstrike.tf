resource "helm_release" "crowdstrike-falcon" {
  name             = "crowdstrike-falcon"
  repository       = "https://crowdstrike.github.io/falcon-helm"
  chart            = "falcon-sensor"
  namespace        = "falcon-system"
  create_namespace = true

  set {
    name  = "falcon.cid"
    value = var.FALCON_CID
  }

  set {
    name  = "falcon.provisioning_token"
    value = var.FALCON_PROVTOKEN
  }

  set {
    name  = "node.image.repository"
    value = "corpsecrunner.azurecr.io/falcon-container/falcon-sensor"
  }

  set {
    name  = "node.image.tag"
    value = "latest"
  }

  set {
    name  = "node.image.registryConfigJSON"
    value = var.FALCON_PULLTOKEN
  }

}
