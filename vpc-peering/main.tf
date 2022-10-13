resource "aws_vpc" "requester" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_vpc" "accepter" {
  cidr_block = "172.31.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = aws_vpc.requester.id
  peer_vpc_id = aws_vpc.accepter.id

  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_subnet" "requester" {
  vpc_id     = aws_vpc.requester.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "requester"
  }
}

resource "aws_subnet" "accepter" {
  vpc_id     = aws_vpc.accepter.id
  cidr_block = "172.31.1.0/24"

  tags = {
    Name = "accepter"
  }
}
resource "aws_route_table" "requester" {
  vpc_id = aws_vpc.requester.id
  route {
    cidr_block = "172.31.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  }
}
resource "aws_route_table" "accepter" {
  vpc_id = aws_vpc.accepter.id
  route {
    cidr_block = "10.0.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  }  
}



#creating routes from req-vpc2 to acc-default
# resource "aws_route" "requester" {
#   route_table_id = aws_route_table.requester.id
#   destination_cidr_block = "172.31.0.0/16"
#   vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
# }

# #Create routes from acc-default to req-vpc2

# resource "aws_route" "accepter" {
#   route_table_id = aws_route_table.accepter.id
#   destination_cidr_block = "10.0.0.0/16"
#   vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
# }
