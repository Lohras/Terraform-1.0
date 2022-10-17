variable "req_cidr" {
    description = "requester CIRD block"
    type = string
    default = "10.0.0.0/16"  
}
variable "acc_cidr" {
    description = "accepterter CIRD block"
    type = string
    default = "172.31.0.0/16"  
}

variable "req_subnet_cidr" {
    description = "requester CIDR block"
    type = string
    default = "10.0.1.0/24"  
}
variable "acc_subnet_cidr" {
    description = "accepterter CIDR block"
    type = string
    default = "172.31.1.0/24"  
}
