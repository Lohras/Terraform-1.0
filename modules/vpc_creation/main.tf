resource "aws_vpc" "requester" {
  cidr_block = var.vpc_req_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Requester-VPC"
  }
}

resource "aws_vpc" "accepter" {
  cidr_block = var.vpc_acc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Accepter-VPC"
  }
}



resource "aws_subnet" "requester" {
  vpc_id     = aws_vpc.requester.id
  cidr_block = var.req_subnet_cidr

  tags = {
    Name = "Requester-subnet"
  }
}

resource "aws_subnet" "accepter" {
  vpc_id     = aws_vpc.accepter.id
  cidr_block = var.acc_subnet_cidr

  tags = {
    Name = "Accepter-subnet"
  }
}

