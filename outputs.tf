# root module
output "project_name" {
  value = module.project.project_name
}

output "project_id" {
  value = module.project.project_id
}

output "project_number" {
  value = module.project.project_number
}

output "service_accounts" {
  value = module.service_accounts.iam_emails
}

output "iam" {
  value = module.iam.roles
}

# network modules

output "vpc" {
  value = module.networks.network
}

output "subnets" {
  value = module.networks.subnets
}

# gke module

#/*
output "gke_cluster_name" {
  value = module.gke.gke_cluster_name
}

output "gke_cluster_id" {
  value = module.gke.gke_cluster_id
}
#*/

/*
output "gke_endpoint" {
  value = module.gke.endpoint
}
*/