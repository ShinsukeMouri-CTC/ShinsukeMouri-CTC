terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.44"
    }
  }
  required_version = ">= 1.3.6"

  # local実行用
  backend "local" {
    path = "main.tfstate"
  }
}
provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      CTC_Bill01_Owner  = "shinsuke.mori.778"
      CTC_Bill02_System = "handson"
    }
  }
}