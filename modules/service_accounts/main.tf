# modules / service_accounts
# https://registry.terraform.io/modules/terraform-google-modules/service-accounts/google/4.1.1

locals {
    project_id = var.project_id
    project_default_sa_account_id = var.project_default_sa_account_id
    project_default_sa_account_role = var.project_default_sa_account_role 
    project_default_sa_account_desc = var.project_default_sa_account_desc
}

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = "${local.project_id}"
  #prefix        = "sa-"
  names         = ["${local.project_default_sa_account_id}"]
  project_roles = [
    "${local.project_id}=>${local.project_default_sa_account_role}",
    #"project-spam=>roles/storage.objectViewer",
  ]
}
