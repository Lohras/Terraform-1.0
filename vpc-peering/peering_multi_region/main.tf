module "vpc-peering-multiple-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = data.aws_vpc.other_region.cidr_block
  reqester_vpc_id = data.aws_vpc.other_region.id
  acc_cidr = var.multi_acc_cidr
  accepter_vpc_id = var.multi_accepter_vpc_id
  # req_route_table_id = data.aws_route_tables.requestor.ids[0]
  # acc_route_table_id = data.aws_route_tables.acceptor.ids[0]
}

output "req_route_table_id" {
  value = data.aws_route_tables.requestor.ids[0]
}

output "acc_route_table_id" {
  value = data.aws_route_tables.acceptor.ids[0]
}