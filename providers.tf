terraform {
  cloud {
    organization = "024_2023-summer-cloud"

    workspaces {
      name = "nov-22-lab"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" // change to your desired AWS region
}
