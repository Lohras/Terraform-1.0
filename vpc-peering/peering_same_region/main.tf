module "vpc-peering-single-region" {
  source = "../../modules/vpc_peering/"
  req_cidr = var.req_cidr
  acc_cidr = var.acc_cidr
  reqester_vpc_id = var.reqester_vpc_id
  accepter_vpc_id = var.accepter_vpc_id
}

# # creating routes from req-vpc2 to acc-default
# resource "aws_route" "requester" {
#   route_table_id = data.aws_route_tables.requestor.ids[0]
#   destination_cidr_block = var.acc_cidr
#   vpc_peering_connection_id = module.vpc-peering-single-region.peering_id
# }

# # #Create routes from acc-default to req-vpc2

# resource "aws_route" "accepter" {
#   route_table_id = data.aws_route_tables.acceptor.ids[0]  
#   destination_cidr_block = var.req_cidr
#   vpc_peering_connection_id = module.vpc-peering-single-region.peering_id
# }

output "requester" {
  value = data.aws_route_tables.requestor
}

output "accepter" {
  value = data.aws_route_tables.acceptor
}