module "addons" {

  source = "./modules/addons"

  cluster_name = var.cluster_name

  vpc_id = var.vpc_id

  aws_region = var.aws_region

}
