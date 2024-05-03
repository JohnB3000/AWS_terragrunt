provider "aws" {
  region = "eu-west-2"
  profile = "jkbk"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "vpc" {
  source = "../../../modules/vpc"

  env = "prod"
  azs = ["eu-west-2a"]
  vpc_cidr_block = "10.1.0.0/16"
  private_subnets = ["10.1.1.0/24"]
  public_subnets = ["10.1.2.0/24"]
  private_subnet_tags = {
    Owner = "John"
  }
  public_subnet_tags = {
    Owner = "John"
  }
}

module "ec2" {
  source = "../../../modules/ec2"


}