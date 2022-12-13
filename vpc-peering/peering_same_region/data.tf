data "aws_route_tables" "requestor" {
  vpc_id = data.aws_vpc.requester.id
}

data "aws_route_tables" "acceptor" {
  vpc_id = data.aws_vpc.accepter.id
}

data "aws_vpc" "requester" {
   id = var.reqester_vpc_id
}
data "aws_vpc" "accepter" {
   id = var.accepter_vpc_id
}
