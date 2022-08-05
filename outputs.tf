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
