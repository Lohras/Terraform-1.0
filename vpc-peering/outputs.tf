output "connection_id" {
  value = aws_vpc_peering_connection.my_peer.id
}

output "requester_id" {
  value = aws_vpc.vpc1.id
}

output "acceptor_id" {
  value = aws_vpc.default.id
}

output "requester_route_table" {
  value =  aws_route_table.requester.id 
}

output "accepter_route_table" {
  value = aws_route_table.accepter.id
}
