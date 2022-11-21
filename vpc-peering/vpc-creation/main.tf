module "vpc-peering-single-region" {
  source = "../../modules/vpc_creation/"
  vpc_req_cidr = var.req_vpc_cidr
  vpc_acc_cidr = var.acc_vpc_cidr
  req_subnet_cidr = var.subnet_req
  acc_subnet_cidr = var.subnet_acc
}
