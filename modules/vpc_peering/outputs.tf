output "data_vpc_acc" {
  value = data.aws_route_tables.acceptor
}

output "data_vpc_req" {
  value = data.aws_route_tables.requestor
}

output "peering_id" {
  value = aws_vpc_peering_connection.my_peer.id
}

output "peering_status" {
  value = aws_vpc_peering_connection.my_peer.accept_status
}

output "acc_vpc_id" {
  value = data.aws_vpc.accepter.id
}