resource "aws_vpc" "requester" {
  cidr_block = var.vpc_req_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Requester-VPC"
  }
}

resource "aws_vpc" "accepter" {
  cidr_block = var.vpc_acc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Accepter-VPC"
  }
}


resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = var.aws_vpc.requester.id
  peer_vpc_id = var.aws_vpc.accepter.id

  auto_accept = var.auto_accept
  accepter {
    allow_remote_vpc_dns_resolution = var.accepter_allow_remote_vpc_dns_resolution
  }

  requester {
    allow_remote_vpc_dns_resolution = var.requester_allow_remote_vpc_dns_resolution
  }
}

resource "aws_subnet" "requester" {
  vpc_id     = aws_vpc.requester.id
  cidr_block = var.req_subnet_cidr

  tags = {
    Name = "Requester-subnet"
  }
}

resource "aws_subnet" "accepter" {
  vpc_id     = aws_vpc.accepter.id
  cidr_block = var.acc_subnet_cidr

  tags = {
    Name = "Accepter-subnet"
  }
}

# creating routes from req-vpc2 to acc-default
resource "aws_route" "requester" {
  route_table_id = aws_vpc.requester.main_route_table_id
  destination_cidr_block = var.acc_subnet_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id 
}

# #Create routes from acc-default to req-vpc2

resource "aws_route" "accepter" {
  route_table_id = aws_vpc.accepter.main_route_table_id
  destination_cidr_block = var.req_subnet_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.my_peer.id
  
}
