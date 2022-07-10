terraform {
    required_version = "1.2.4"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.22.0"
        }
    }
}
provider "aws" {
    profile = "violetta"
    region = "eu-north-1"
}