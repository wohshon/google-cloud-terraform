# modules / iam
# https://registry.terraform.io/modules/terraform-google-modules/iam/google/7.4.1/submodules/member_iam

locals {
    project_id = var.project_id
    project_user = var.project_user
    project_user_role = var.project_user_role
}

module "member_roles" {
  source                  = "terraform-google-modules/iam/google//modules/member_iam"
  service_account_address = "${local.project_user}"
  prefix                  = "user"
  project_id              = "${local.project_id}"
  project_roles           = ["${local.project_user_role}"]
}
/*
module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = ["${local.project_id}"]
  mode     = "additive"

  bindings = {
    "${local.project_user_role}" = [
      "user:${local.project_user}",
      # "group:my-group@my-org.com",
      # "user:my-user@my-org.com",
    ]
    # another binding
    # "roles/appengine.appAdmin" = [
    #  "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
    #  "group:my-group@my-org.com",
    #  "user:my-user@my-org.com",
    # ]
  }
}
*/