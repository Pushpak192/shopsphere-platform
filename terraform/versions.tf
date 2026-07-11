terraform {
  required_version = "~> 1.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "shopsphere-terraform-state-047612973664"
    key            = "platform/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "shopsphere-terraform-lock"
    encrypt        = true
  }
}
