variable "req_vpc_cidr" {
    type = string
    default = "172.35.0.0/16"
}
variable "acc_vpc_cidr" {
    type = string
    default = "30.0.0.0/16"
}

variable "subnet_req" {
    type = string
    default = "172.35.1.0/24"
}

variable "subnet_acc" {
    type = string
    default = "30.0.1.0/24"
}
