# containers all provider related config

provider "google" {
  alias = "impersonate"
  region      = var.region
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]  
}

# need to run this as tf-user which has permission to impersonate var.tf_sa
data "google_service_account_access_token" "default" {
  provider               = google.impersonate
  target_service_account = var.tf_sa
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "600s"
}

/******************************************
  Provider credential configuration
 *****************************************/
provider "google" {
  access_token = data.google_service_account_access_token.default.access_token
}

provider "google-beta" {
  access_token = data.google_service_account_access_token.default.access_token
}

# TODO configure backend to point to gcs
# # backend
/*
terraform {
  backend "gcs" {
    bucket      = "wohshon-altostrat-tf-state"
    prefix      = "[project_name]\\tfstate"
  }
}
*/
