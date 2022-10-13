data "aws_route_table" "selected" {
  vpc_id = aws_vpc.requester.id
  filter {
    name = "association.main"
    values = true
  }
}
