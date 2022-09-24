terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  resource "aws_vpc" "vpc1" {
    cidr_block = "192.168.0.0/16"
  }

  resource "aws_vpc" "vpc2" {
    cidr_block = "10.0.0.0/16"
  }

  resource "aws_vpc_peering_connection" "vpc1" {
    vpc_id      = aws_vpc.vpc1.id
    peer_vpc_id = aws_vpc.vpc2.id
    auto_accept = true
  }  

  resource "aws_vpc_peering_connection_options" "vpc1" {
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc1.id

    accepter {
      allow_remote_vpc_dns_resolution = true
    }

    requester {
      allow_vpc_to_remote_classic_link = true
      allow_classic_link_to_remote_vpc = true
    }
  }
}

