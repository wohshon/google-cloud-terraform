# create project

module "project" {
  source = "./modules/projects"
  folder_id = var.folder_id
  billing_account = var.billing_account
  project_name = var.project_name
  project_id = var.project_id
  org_id = var.org_id
}