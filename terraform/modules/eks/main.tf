########################################
# EKS Cluster
########################################

resource "aws_eks_cluster" "this" {

  name     = "${var.project_name}-${var.environment}-eks"
  role_arn = var.cluster_role_arn
  version  = var.kubernetes_version

  vpc_config {

    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true

  }

  access_config {

    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true

  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks"
    }
  )
}

########################################
# Managed Node Group
########################################

resource "aws_eks_node_group" "default" {

  cluster_name    = aws_eks_cluster.this.name

  node_group_name = "default"

  node_role_arn   = var.worker_node_role_arn

  subnet_ids      = var.private_subnet_ids

  instance_types = [
    var.instance_type
  ]

  capacity_type = "ON_DEMAND"

  ami_type = "AL2023_x86_64_STANDARD"

  scaling_config {

    desired_size = var.desired_size

    min_size = var.min_size

    max_size = var.max_size

  }

  update_config {

    max_unavailable = 1

  }

  depends_on = [
    aws_eks_cluster.this
  ]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-default-nodegroup"
    }
  )

}

