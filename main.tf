terraform {
  required_version = ">= 1.3.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.44"
    }
  }
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
      Method            = "Terraform"
      IaC_Repo          = "https://github.com/ShinsukeMouri-CTC/ShinsukeMouri-CTC.git"
      tfstate_Location  = "2h9942_localPC"
    }
  }
}