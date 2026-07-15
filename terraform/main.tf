module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs

  common_tags = local.common_tags

}

module "iam" {

  source = "./modules/iam"

  project_name = var.project_name

  environment = var.environment

  common_tags = local.common_tags

}

module "eks" {

  source = "./modules/eks"

  project_name = var.project_name

  environment = var.environment

  cluster_role_arn = module.iam.cluster_role_arn

  worker_node_role_arn = module.iam.worker_node_role_arn

  private_subnet_ids = module.vpc.private_subnet_ids

  kubernetes_version = var.kubernetes_version

  instance_type = var.instance_type

  desired_size = var.desired_size

  min_size = var.min_size

  max_size = var.max_size

  common_tags = local.common_tags

}
