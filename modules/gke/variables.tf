# modules / gke

variable "project_id" {
    type = string
}

variable "gke_cluster_name" {
    type = string
}

variable "region" {
    type = string
}

variable "network_name" {
    type = string
}

variable "subnet_names" {
    type = list(string)
}

variable "service_account" {
    type = string
}

variable "ip_range_pods_name" {
    type = string
}

variable "ip_range_services_name" {
    type = string
}