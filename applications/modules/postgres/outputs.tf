output "release" {
  value = helm_release.postgres.status
}
