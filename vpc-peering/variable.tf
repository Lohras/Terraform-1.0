// Variables are required to pass them via Terratest
// on fixtures creation
variable "this_vpc_id" {}

variable "peer_vpc_id" {
  type = string
  default = 
}

variable "aws_this_access_key" {
  type = string
  default =
  description = "AWS Access Key for requester account"
  
}

variable "aws_this_secret_key" {
  type = string
  default = 
  description = "AWS Secret Key for requester account"
}