data "aws_route_table" "requester" {
  subnet_id = aws_subnet.requester.id
  # vpc_id = aws_vpc.requester.id
  filter {
    name = "association.main"
    values = data.aws_route_table.requester.id
  }
}

data "aws_route_table" "accepter" {
  subnet_id = aws_subnet.accepter.id
  filter {
    name = "association.main"
    values = data.aws_route_table.accepter.id
  }
}
