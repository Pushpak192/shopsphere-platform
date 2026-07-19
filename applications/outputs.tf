output "namespace" {
  value = module.namespace.namespace
}

output "postgres_release" {
  value = module.postgres.release
}

output "secret_name" {
  value = module.secrets.secret_name
}

output "backend_repository_url" {
  value = module.ecr.backend_repository_url
}

output "frontend_repository_url" {
  value = module.ecr.frontend_repository_url
}
