output "requester_vpc" {
    value = module.vpc-peering-single-region.aws_vpc.requester.id
}
output "accepter_vpc" {
    value = module.vpc-peering-single-region.aws_vpc.accepter.id
}

output "connection_id" {
  value       = module.vpc-peering-single-region.aws_vpc_peering_connection.my_peer.id
  description = "VPC peering connection ID"
}
output "requester_subnet" {
  value = module.vpc-peering-single-region.aws_subnet.requester.id  
}
output "accepter_subnet" {
  value = module.vpc-peering-single-region.aws_subnet.accepter.id  
}
output "accepter_route" {
  value = module.vpc-peering-single-region.aws_route.accepter.id
}
output "requester_route" {
  value = module.vpc-peering-single-region.aws_route.requester.id
}
