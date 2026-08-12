resource "aws_eks_access_entry" "jenkins" {

  cluster_name  = aws_eks_cluster.this.name
  principal_arn = var.jenkins_role_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "jenkins_admin" {

  cluster_name  = aws_eks_cluster.this.name
  principal_arn = var.jenkins_role_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
