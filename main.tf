# Root module

# create project

module "project" {
  source = "./modules/projects"
  folder_id = var.folder_id
  billing_account = var.billing_account
  project_name = var.project_name
  project_id = var.project_id
  org_id = var.org_id
}

# create default service account
module "service_accounts" {
  source = "./modules/service_accounts"
  project_default_sa_account_id  = var.project_default_sa_account_id
  project_default_sa_account_role  = var.project_default_sa_account_role
  project_default_sa_account_desc = var.project_default_sa_account_desc
  project_id = var.project_id
}

# create user for project
module "iam" {
  source = "./modules/iam"
  project_id = var.project_id
  project_user = var.project_user
  project_user_role = var.project_user_role

}
# enable services

# create a custom network with 3 subnets
#/*
module "networks" {
  source = "./modules/networks"
  project_id = var.project_id
  region = var.region
  network_name = var.network_name
  routing_mode = var.routing_mode
  subnet_names = var.subnet_names
  subnet_ips = var.subnet_ips
  subnet_desc = var.subnet_desc  
  ip_range_pods = var.ip_range_pods
  ip_range_services = var.ip_range_services
  ip_range_pods_name = var.ip_range_pods_name
  ip_range_services_name = var.ip_range_services_name  
}
#*/
module "org_policies" {
  source = "./modules/org_policies"
  project_id = var.project_id  
}

# /* 

module "gke" {
  source = "./modules/gke"
  project_id = module.project.project_id
  region = var.region
  gke_cluster_name = var.gke_cluster_name
  network_name = module.networks.network.network_name
  subnet_names = var.subnet_names
  service_account = "${var.project_default_sa_account_id}@${var.project_id}.iam.gserviceaccount.com"
  ip_range_pods_name = var.ip_range_pods_name
  ip_range_services_name = var.ip_range_services_name  
}
# */

