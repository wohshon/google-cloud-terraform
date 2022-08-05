# modules / networks
variable "region" {
    type    = string
}

variable "project_id" {
    type    = string
}

variable "network_name" {
    type    = string
}

variable "routing_mode" {
    type    = string
}

variable "subnet_names" {
    type    = list(string)
}

variable "subnet_ips" {
    type    = list(string)
}
variable "subnet_desc" {
    type    = list(string)
}
