
resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = data.aws_vpc.requester.id
  peer_vpc_id = data.aws_vpc.accepter.id

  auto_accept = var.auto_accept
  accepter {
    allow_remote_vpc_dns_resolution = var.accepter_allow_remote_vpc_dns_resolution
  }

  requester {
    allow_remote_vpc_dns_resolution = var.requester_allow_remote_vpc_dns_resolution
  }

  lifecycle {
    create_before_destroy = true
  }
}


# creating routes from req-vpc2 to acc-default
resource "aws_route" "requester" {
  route_table_id = data.aws_route_tables.requestor.id
  destination_cidr_block = var.acc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id 
}

# #Create routes from acc-default to req-vpc2

resource "aws_route" "accepter" {
  route_table_id = data.aws_route_tables.acceptor.id
  destination_cidr_block = var.req_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id 
}
