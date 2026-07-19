output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "eks_cluster_role_arn" {
  value = module.iam.cluster_role_arn
}

output "worker_node_role_arn" {
  value = module.iam.worker_node_role_arn
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_arn" {
  value = module.eks.cluster_arn
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_version" {
  value = module.eks.cluster_version
}

output "oidc_issuer" {
  value = module.eks.oidc_issuer
}

output "node_group_name" {
  value = module.eks.node_group_name
}

