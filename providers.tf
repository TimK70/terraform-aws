#---providers.tf/mtc---
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

#Configure AWS Provider
provider "aws" {
  region = var.aws_region
}