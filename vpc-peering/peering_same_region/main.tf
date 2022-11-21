module "vpc-peering-single-region" {
  source = "../../modules/vpc_peering/"
  req_subnet_cidr = var.req_cidr
  acc_subnet_cidr = var.acc_cidr
}