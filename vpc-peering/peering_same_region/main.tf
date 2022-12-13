module "vpc-peering-single-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = var.req_cidr
  acc_cidr = var.acc_cidr
  reqester_vpc_id = var.reqester_vpc_id
  accepter_vpc_id = var.accepter_vpc_id
  req_route_table_id = data.aws_route_tables.requestor.ids[0]
  acc_route_table_id = data.aws_route_tables.acceptor.ids[0]  
}