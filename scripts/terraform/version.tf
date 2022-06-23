terraform {
  backend "remote" {
    organization = "interopt"
    workspaces {
      name = "Loonie_bets"
    }

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~4.19.0"
    }
  }
}