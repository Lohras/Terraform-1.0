module "vpc-peering-multiple-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = data.aws_vpc.other_region.cidr_block
  reqester_vpc_id = data.aws_vpc.other_region.id
  acc_cidr = var.multi_acc_cidr
  accepter_vpc_id = var.multi_accepter_vpc_id
}

