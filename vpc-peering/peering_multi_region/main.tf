module "vpc-peering-multiple-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = data.aws_vpc.other_region.cidr_block
  reqester_vpc_id = data.aws_vpc.other_region.id
  acc_cidr = var.multi_acc_cidr
  accepter_vpc_id = var.multi_accepter_vpc_id
}



# creating routes from req-vpc2 to acc-default
resource "aws_route" "requester" {
  provider = aws.peer
  route_table_id = data.aws_route_tables.requestor.ids[0]
  destination_cidr_block = var.multi_acc_cidr
  vpc_peering_connection_id = module.vpc-peering-multiple-region.peering_id
}

# #Create routes from acc-default to req-vpc2

resource "aws_route" "accepter" {
  route_table_id = data.aws_route_tables.acceptor.ids[0]
  destination_cidr_block = data.aws_vpc.other_region.cidr_block
  vpc_peering_connection_id = module.vpc-peering-multiple-region.peering_id
}