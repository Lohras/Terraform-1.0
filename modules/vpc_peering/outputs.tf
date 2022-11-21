output "data_vpc_acc" {
  value = data.aws_route_tables.acceptor
}

output "data_vpc_req" {
  value = data.aws_route_tables.requestor
}