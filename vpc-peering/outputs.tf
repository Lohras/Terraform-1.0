output "connection_id" {
  value = aws_vpc_peering_connection.my_peer.id
}

output "requester_id" {
  value = aws_vpc.requester.id
}

output "accepter_id" {
  value = aws_vpc.accepter.id
}

output "requester_subnet" {
  value = aws_subnet.requester.id
}

output "accepter_subnet" {
  value = aws_subnet.accepter.id
}
output "requester_route_table" {
  value = aws_route_table.requester.id 
}

output "accepter_route_table" {
  value = aws_route_table.accepter.id
}

