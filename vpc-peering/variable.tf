#variables for vpc 1 in us-east-2
variable "vpcname" {
  type        = string
  default     = "vpc1"
  description = "VPC for project mouse"
}


variable "vpccidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "privatesubnetname" {
  type    = string
  default = "private"
}

variable "privatesubnet" {
  type        = list(string)
  default     = ["192.168.3.0/24"]
  description = "private subnet for private/db instances"
}

variable "publicsubnetname" {
  type    = string
  default = "public"
}


variable "publicsubnet" {
  type        = list(string)
  default     = ["192.168.1.0/24", "192.168.2.0/24"]
  description = "public subnet"
}

#variables for vpc 2 in us-west-2
variable "vpcname.uat" {
  type        = string
  default     = "vpc2"
  description = "VPC for project mouse"
}


variable "vpccidr.uat" {
  type    = string
  default = "10.0.0.0/16"
}

variable "privatesubnetname.uat" {
  type    = string
  default = "private"
}

variable "privatesubnet.uat" {
  type        = list(string)
  default     = ["10.0.3.0/24"]
  description = "private subnet for private/db instances"
}

variable "publicsubnetname.uat" {
  type    = string
  default = "public"
}


variable "publicsubnet.uat" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "public subnet"
}