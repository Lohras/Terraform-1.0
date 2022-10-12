resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

}

resource "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.default.id

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
  route_table_id = aws_route.requester.id
  destination_cidr_block = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}

#Create routes from acc-default to req-vpc2

resource "aws_route" "accepter" {
  route_table_id = aws_route.accepter.id
  destination_cidr_block = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}
