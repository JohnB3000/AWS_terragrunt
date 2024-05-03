variable "env" {
    description = "Enviroment name"
    type = string
}

variable "vpc_cidr_block" {
    description = "CIDR (Classless Inter-Domain Routing)."
    type = string
    default = "10.0.0.0/16"
}

variable "azs" {
    description = "Availibility zones for subnets."
    type = list(string)
}

variable "private_subnets" {
    description = "CIDR ranges for private subnets."
    type = list(string)
}

variable "public_subnets" {
    description = "CIDR ranges for public subnets."
    type = list(string)
}

variable "private_subnet_tags" {
    description = "private subnet tags."
    type = map(any)
}

variable "public_subnet_tags" {
    description = "public subnet tags."
    type = map(any)
}