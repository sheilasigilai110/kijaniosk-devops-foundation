provider "aws" {
  region = "eu-north-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Remote backend (REQUIRED)
  backend "s3" {
    bucket         = "kijanikiosk-terraform-state-237108087546"
    key            = "week4/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "kijanikiosk-locks"
  }
}
