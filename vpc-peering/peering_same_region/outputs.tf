output "from_module_acc" {
  value = module.vpc-peering-single-region.data_vpc_acc
}

output "from_module_req" {
  value = module.vpc-peering-single-region.data_vpc_req
}