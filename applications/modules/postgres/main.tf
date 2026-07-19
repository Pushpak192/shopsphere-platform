resource "helm_release" "postgres" {

  name       = "postgres"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"
  version    = "18.8.0"

  namespace        = var.namespace
  create_namespace = false

  timeout = 900

  set {
    name  = "auth.username"
    value = "shopsphere"
  }

  set {
    name  = "auth.password"
    value = "shopsphere123"
  }

  set {
    name  = "auth.database"
    value = "shopsphere"
  }

  set {
    name  = "primary.persistence.enabled"
    value = "true"
  }

  set {
    name  = "primary.persistence.storageClass"
    value = "gp2"
  }

  set {
    name  = "primary.persistence.size"
    value = "8Gi"
  }

}
