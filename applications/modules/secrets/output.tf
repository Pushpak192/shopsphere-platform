output "secret_name" {

  value = kubernetes_secret.app_secret.metadata[0].name

}
