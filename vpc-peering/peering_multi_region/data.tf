data "aws_vpc" "other_region" {
  id = var.other_region_vpc
  provider = aws.peer
}

