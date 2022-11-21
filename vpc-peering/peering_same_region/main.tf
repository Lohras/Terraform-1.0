module "vpc-peering-single-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = var.req_cidr
  acc_cidr = var.acc_cidr
}