data "aws_eks_cluster" "cluster" {

  name = var.cluster_name

}

data "tls_certificate" "oidc" {

  url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer

}

resource "aws_iam_openid_connect_provider" "eks" {

  url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.oidc.certificates[0].sha1_fingerprint
  ]
}

##############################################
# EBS CSI IAM Role
##############################################

data "aws_iam_policy_document" "ebs_csi_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks.arn
      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:ebs-csi-controller-sa"
      ]

    }

  }

}

resource "aws_iam_role" "ebs_csi" {

  name = "${var.cluster_name}-ebs-csi-role"

  assume_role_policy = data.aws_iam_policy_document.ebs_csi_assume_role.json

}

resource "aws_iam_role_policy_attachment" "ebs_csi" {

  role = aws_iam_role.ebs_csi.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

}

##############################################
# EBS CSI Addon
##############################################

resource "aws_eks_addon" "ebs_csi" {

  cluster_name = var.cluster_name

  addon_name = "aws-ebs-csi-driver"

  service_account_role_arn = aws_iam_role.ebs_csi.arn

  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [

    aws_iam_role_policy_attachment.ebs_csi

  ]

}

##############################################
# AWS Load Balancer Controller IAM Policy
##############################################

resource "aws_iam_policy" "alb_controller" {

  name = "${var.cluster_name}-alb-controller-policy"

  policy = file("${path.root}/policies/aws-load-balancer-controller.json")

}

##############################################
# ALB Controller IAM Assume Role
##############################################

data "aws_iam_policy_document" "alb_controller_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks.arn
      ]

    }

    condition {

      test = "StringEquals"

      variable = "${replace(data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:aws-load-balancer-controller"
      ]

    }

  }

}

resource "aws_iam_role" "alb_controller" {

  name = "${var.cluster_name}-alb-controller-role"

  assume_role_policy = data.aws_iam_policy_document.alb_controller_assume_role.json

}

resource "aws_iam_role_policy_attachment" "alb_controller" {

  role = aws_iam_role.alb_controller.name

  policy_arn = aws_iam_policy.alb_controller.arn

}

##############################################
# Kubernetes Service Account
##############################################

resource "kubernetes_service_account" "alb_controller" {

  metadata {

    name = "aws-load-balancer-controller"

    namespace = "kube-system"

    annotations = {

      "eks.amazonaws.com/role-arn" = aws_iam_role.alb_controller.arn

    }

  }

}

##############################################
# Helm Repository
##############################################

resource "helm_release" "alb_controller" {

  name = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"

  chart = "aws-load-balancer-controller"

  namespace = "kube-system"

  depends_on = [

    kubernetes_service_account.alb_controller

  ]

  set {

    name = "clusterName"

    value = var.cluster_name

  }

  set {

    name = "serviceAccount.create"

    value = "false"

  }

  set {

    name = "serviceAccount.name"

    value = "aws-load-balancer-controller"

  }
  
  set {

    name  = "region"

    value = var.aws_region

  } 

  set {

    name  = "vpcId"

    value = var.vpc_id

  }

}

##############################################
# Metrics Server
##############################################

resource "helm_release" "metrics_server" {

  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"

  chart = "metrics-server"

  namespace = "kube-system"

}

