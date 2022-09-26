module "vpc-peering-single-region" {
  source = "../modules-vpc"
  vpc_req_cidr = "172.35.0.0/16"
  vpc_acc_cidr = "20.0.0.0/16"
  req_subnet_cidr = "172.35.1.0/24"
  acc_subnet_cidr = "20.0.1.0/24"
}