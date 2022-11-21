module "vpc-peering-single-region" {
  source = "../modules/vpc_creation/"
  vpc_req_cidr = var.req_cidr
  vpc_acc_cidr = var.acc_cidr
  req_subnet_cidr = var.req_subnet_cidr
  acc_subnet_cidr = var.acc_subnet_cidr
}