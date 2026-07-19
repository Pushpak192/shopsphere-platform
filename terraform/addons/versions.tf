terraform {

  required_version = ">= 1.10"

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "~> 6.0"

    }

    kubernetes = {

      source = "hashicorp/kubernetes"

      version = "~> 2.38"

    }

    helm = {

      source = "hashicorp/helm"

      version = "~> 2.17"

    }

    tls = {

      source = "hashicorp/tls"

      version = "~> 4.0"

    }

  }

}
