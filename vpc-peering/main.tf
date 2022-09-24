terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

resource "aws_vpc_peering_connection" "vpc1" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.aws_vpc.vpc2.id
  vpc_id        = var.aws_vpc.vpc1.id
  peer_region   = "us-east-2"
}

resource "aws_vpc" "vpc2" {
  provider   = aws.us-west-2
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "vpc1" {
  provider   = aws.us-east-2
  cidr_block = "192.168.0.0/16"
}