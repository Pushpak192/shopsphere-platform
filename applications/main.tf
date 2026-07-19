module "namespace" {

  source = "./modules/namespace"

  namespace = "shopsphere"

}

module "postgres" {

  source = "./modules/postgres"

  namespace = module.namespace.namespace

  depends_on = [
    module.namespace
  ]

}

module "secrets" {

  source = "./modules/secrets"

  namespace = module.namespace.namespace

  db_username = var.db_username

  db_password = var.db_password

  db_name = var.db_name

  jwt_secret = var.jwt_secret

  app_secret = var.app_secret

  depends_on = [
    module.namespace
  ]

}

module "ecr" {

  source = "./modules/ecr"

  project_name = "shopsphere"

  environment = "dev"

}
