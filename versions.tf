terraform {
  required_version = "~> 1.4.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.64.0"
    }
  }
}
