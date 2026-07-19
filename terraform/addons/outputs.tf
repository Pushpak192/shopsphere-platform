output "oidc_provider_arn" {

  value = module.addons.oidc_provider_arn

}

output "ebs_csi_role_arn" {

  value = module.addons.ebs_csi_role_arn

}

output "alb_controller_role_arn" {

  value = module.addons.alb_controller_role_arn

}

output "alb_release" {

  value = module.addons.alb_release

}

output "metrics_server_release" {

  value = module.addons.metrics_server_release

}
