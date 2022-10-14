

data "aws_vpc" "requester" {
  id = var.vpc_id
}
data "aws_vpc" "accepter" {
  id = var.peer_vpc_id
}

data "aws_route_table" "requester" {
  subnet_id = aws_subnet.requester.id
  # vpc_id = aws_vpc.requester.id
  filter {
         name = "association.main"
    values = true
  }
}

data "aws_route_table" "accepter" {
  subnet_id = aws_subnet.accepter.id
}
