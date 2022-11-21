module "vpc-peering-single-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = var.req_cidr
  acc_cidr = var.acc_cidr
  reqester_vpc_id = var.reqester_vpc_id
  accepter_vpc_id = var.accepter_vpc_id
}