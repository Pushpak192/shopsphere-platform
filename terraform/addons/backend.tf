terraform {

  backend "s3" {

    bucket         = "shopsphere-terraform-state-047612973664"

    key            = "addons/dev/terraform.tfstate"

    region         = "ap-south-1"

    dynamodb_table = "shopsphere-terraform-lock"

    encrypt        = true

  }

}
