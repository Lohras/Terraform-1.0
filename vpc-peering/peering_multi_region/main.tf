module "vpc-peering-multiple-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = module.same-region.req_cidr
  reqester_vpc_id = module.same-region.reqester_vpc_id
  acc_cidr = var.multi_acc_cidr
  accepter_vpc_id = var.multi_accepter_vpc_id
}

module "same-region" {
  source = "../peering_same_region"
  req_cidr = var.req_cidr
  acc_cidr = var.acc_cidr
  reqester_vpc_id = var.reqester_vpc_id
  accepter_vpc_id = var.accepter_vpc_id  
}