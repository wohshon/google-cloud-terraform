# root module


variable "region" {
    type = string
    default = "asia-southeast1"
    description = "GCP region" 
}

# project-factory modules

variable "org_id" {
  type = string
  description ="org id"
}


variable "tf_sa" {
  type = string
  description ="Service account name"
}


variable "billing_account" {
    type = string
    description = "billing account"
}

variable "project_name" {
    type = string
    description = "project_name"
}

variable "project_id" {
    type = string
    description = "project_id"
}


variable "folder_id" {
    type = string
    description = "Folder ID"
}

# service_account modules

variable "project_default_sa_account_id" {
    type = string
    description = "default sa account id / email"
}

variable "project_default_sa_account_role" {
    type = string
    description = "default sa account role"

}

variable "project_default_sa_account_desc" {
    type = string
    description = "default sa account desc"
}

# iam 

variable "project_user" {
    type = string
    description = "project user"
}

variable "project_user_role" {
    type = string
    description = "project user_role"
}

# network

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


variable "ip_range_pods" {
  type = string
}

variable "ip_range_services" {
  type = string
}

variable "ip_range_pods_name" {
  type = string
}

variable "ip_range_services_name" {
  type = string
}

# gke 
variable "gke_cluster_name" {
    type = string
}

