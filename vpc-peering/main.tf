resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = "vpc-046e52b0fcea541e3"
  peer_vpc_id = "vpc-052159a81c56277c9"

  auto_accept = true
  
  acceptor {
    allow_remote_vpc_dns_solution = true
  }

  requestor {
    allow_remote_vpc_dns_solution = true
  }
}

#creating routes from req-vpc2 to acc-default
resource "aws_route" "requestor" {
  route_table_id = "rtb-00ce6fb93d8eb8f43"
  destination_cidr_block = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}

#Create routes from acc-default to req-vpc2

resource "aws_route" "acceptor" {
  route_table_id = "rtb-0208729dfa5c7fb47"
  destination_cidr_block = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}