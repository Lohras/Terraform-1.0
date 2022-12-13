data "aws_route_tables" "requestor" {
  vpc_id = var.reqester_vpc_id
}

data "aws_route_tables" "acceptor" {
  vpc_id = var.accepter_vpc_id
}