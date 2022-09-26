module "requester_vpc" {
    source = "../vpc-peering"
    cidr_block = var.requester_vpc_cidr
}

module "requester_subnet" { 
    source = "../vpc-peering"
    vpc_id = module.requester_vpc.vpc_id
    cidr_block = module.requester_vpc.vpc_cidr_block
    nat_gateway_enabled = false
    nat_instance_enabled = false
}

module "accepter_vpc" {
    source = "../vpc-peering"
    cidr_block = var.accepter_vpc_cidr
}

module "accepter_subnet" { 
    source = "../vpc-peering"
    vpc_id = module.accepter_vpc.vpc_id
    cidr_block = module.accepter_vpc.vpc_cidr_block
    nat_gateway_enabled = false
    nat_instance_enabled = false
}

module "vpc_peering" {
    source = "../vpc-peering"
    auto_accept = true
    requester_allow_remote_vpc_dns_resolution = true
    accepter_allow_remote_vpc_dns_resolution  = true
    requester_vpc_id                          = module.requester_vpc.vpc_id
    accepter_vpc_id                           = module.accepter_vpc.vpc_id
}
