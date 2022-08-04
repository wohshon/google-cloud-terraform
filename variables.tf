# root module


variable "region" {
    type = string
    default = "asia-southeast1"
    description = "GCP region" 
}

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

