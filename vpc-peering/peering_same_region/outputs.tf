output "peering_id" {
  value = module.vpc-peering-single-region.peering_id
}

output "peering_status" {
  value = module.vpc-peering-single-region.peering_status
}

output "accepter_vpc_id" {
  value = module.vpc-peering-single-region.acc_vpc_id
}

output "req_cidr" {
  value = var.req_cidr
}

output "reqester_vpc_id" {
  value = var.reqester_vpc_id
}