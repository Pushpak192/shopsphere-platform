output "oidc_provider_arn" {

  value = aws_iam_openid_connect_provider.eks.arn

}

output "ebs_csi_role_arn" {

  value = aws_iam_role.ebs_csi.arn

}

output "alb_controller_role_arn" {

  value = aws_iam_role.alb_controller.arn

}

output "alb_release" {

  value = helm_release.alb_controller.status

}

output "metrics_server_release" {

  value = helm_release.metrics_server.status

}

