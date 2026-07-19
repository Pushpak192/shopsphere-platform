resource "kubernetes_secret" "app_secret" {

  metadata {

    name = "shopsphere-secret"

    namespace = var.namespace

  }

  type = "Opaque"

  data = {

    DB_USERNAME = var.db_username

    DB_PASSWORD = var.db_password

    DB_NAME = var.db_name

    JWT_SECRET = var.jwt_secret

    APP_SECRET = var.app_secret

  }

}
