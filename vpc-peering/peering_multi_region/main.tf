module "vpc-peering-multiple-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = var.req_cidr
  acc_cidr = module.same-region.acc_cidr
  reqester_vpc_id = var.reqester_vpc_id
  accepter_vpc_id = module.same-region.accepter_vpc_id
  
}

module "same-region" {
  source = "../peering_same_region"
}