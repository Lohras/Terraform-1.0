data "aws_vpc" "other_region" {
  id = var.other_region_vpc
  provider = aws.peer
}

data "aws_route_tables" "requestor" {
  provider = aws.peer    
  vpc_id = var.other_region_vpc
}

data "aws_route_tables" "acceptor" {
  vpc_id = var.multi_accepter_vpc_id
}
