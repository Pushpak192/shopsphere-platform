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
