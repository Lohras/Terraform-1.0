resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = "vpc-0de3699e0d9e7e186"
  peer_vpc_id = "vpc-0e7724f33e892da9f"

  auto_accept = true
  
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

#creating routes from req-vpc2 to acc-default
resource "aws_route" "requester" {
  route_table_id = "rtb-0b0ea353ccafb2753"
  destination_cidr_block = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}

#Create routes from acc-default to req-vpc2

resource "aws_route" "accepter" {
  route_table_id = "rtb-0c24e2e75f6ea1395"
  destination_cidr_block = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}
