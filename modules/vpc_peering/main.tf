
resource "aws_vpc_peering_connection" "my_peer" {
  vpc_id = var.reqester_vpc_id
  peer_vpc_id = var.accepter_vpc_id

  auto_accept = var.auto_accept
  accepter {
    allow_remote_vpc_dns_resolution = var.accepter_allow_remote_vpc_dns_resolution
  }

  requester {
    allow_remote_vpc_dns_resolution = var.requester_allow_remote_vpc_dns_resolution
  }

  lifecycle {
    create_before_destroy = true
  }
}

