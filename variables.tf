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