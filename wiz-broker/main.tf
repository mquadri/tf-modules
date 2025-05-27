resource "kubernetes_namespace" "wiz" {
  metadata {
    name = "wiz"
  }
}

resource "kubernetes_service_account" "wiz_cluster_reader" {
  metadata {
    name      = "wiz-cluster-reader"
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }
}

resource "kubernetes_cluster_role" "wiz_cluster_reader" {
  metadata {
    name = "wiz-cluster-reader"
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = ["*"]
    resources  = ["*"]
  }
}

resource "kubernetes_cluster_role_binding" "wiz_cluster_reader" {
  metadata {
    name = "wiz_cluster_reader"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.wiz_cluster_reader.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.wiz_cluster_reader.metadata[0].name
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }
}

resource "kubernetes_service_account" "wiz_tf_deploy" {
  metadata {
    name      = "wiz-tf-deploy"
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }
}

resource "kubernetes_role" "wiz_tf_deploy_role" {
  metadata {
    name      = "wiz-tf-deploy-role"
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }

  rule {
    verbs      = ["*"]
    api_groups = ["*"]
    resources  = ["*"]
  }
}

resource "kubernetes_role_binding" "wiz_tf_deploy_access_binding" {
  metadata {
    name      = "wiz-tf-deploy-access-binding"
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.wiz_tf_deploy_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.wiz_tf_deploy.metadata[0].name
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }
}

resource "kubernetes_secret" "wiz_tf_deploy" {
  metadata {
    name      = "wiz-tf-deploy"
    namespace = kubernetes_namespace.wiz.metadata[0].name
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.wiz_tf_deploy.metadata[0].name
    }
  }

  type = "kubernetes.io/service-account-token"
}

data "kubernetes_secret" "wiz_tf_deploy_print" {
  metadata {
    name      = kubernetes_secret.wiz_tf_deploy.metadata[0].name
    namespace = kubernetes_namespace.wiz.metadata[0].name
  }
}

output "wiz_tf_deploy_token" {
  value = data.kubernetes_secret.wiz_tf_deploy_print.data["token"]
}
