variable "req_cidr" {
    description = "requester CIDR block"
    type = string
}
variable "acc_cidr" {
    description = "accepterter CIDR block"
    type = string
}

variable "auto_accept" {
    type = bool
    default = false
}
variable "accepter_allow_remote_vpc_dns_resolution" {
    type = bool
    default = true
}

variable "requester_allow_remote_vpc_dns_resolution" {
    type = bool
    default = true
}

variable "reqester_vpc_id" {}
variable "accepter_vpc_id" {}