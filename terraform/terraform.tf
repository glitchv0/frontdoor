terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "jke-terraform"
    key    = "frontdoor/terraform.tfstate"
    region = "us-east-1"
  }
}
