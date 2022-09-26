variable "vpc_req_cidr" {
    description = "requester CIDR block"
    type = string
}
variable "vpc_acc_cidr" {
    description = "accepterter CIDR block"
    type = string 
}

variable "req_subnet_cidr" {
    description = "requester CIDR block"
    type = string
}
variable "acc_subnet_cidr" {
    description = "accepterter CIDR block"
    type = string
}

variable "auto_accept" {
    type = bool
    default = true
}
variable "accepter_allow_remote_vpc_dns_resolution" {
    type = bool
    default = true
}

variable "requester_allow_remote_vpc_dns_resolution" {
    type = bool
    default = true
}