# modules / org_policies
locals {
    project_id = var.project_id
}

module "org-policy-requireOsLogin" {
  source = "terraform-google-modules/org-policy/google"
  constraint = "constraints/compute.requireOsLogin"
  policy_type = "boolean"
  policy_for = "project"  
  project_id = local.project_id
  enforce = false  
}

module "org-policy-vmExternalIpAccess" {
  source = "terraform-google-modules/org-policy/google"
  constraint = "constraints/compute.vmExternalIpAccess"
  policy_type = "list"
  policy_for = "project"  
  project_id = local.project_id
  enforce = false  
}

module "org-policy-requireShieldedVm" {
  source = "terraform-google-modules/org-policy/google"
  constraint = "constraints/compute.requireShieldedVm"
  policy_type = "boolean"
  policy_for = "project"  
  project_id = local.project_id
  enforce = false  
}

module "org-policy-disableServiceAccountKeyCreation" {
  source = "terraform-google-modules/org-policy/google"
  constraint  = "constraints/iam.disableServiceAccountKeyCreation"
  policy_type = "boolean"
  policy_for = "project"  
  project_id = local.project_id
  enforce = false  
}


module "org-policy-restrictVpcPeering" {
  source = "terraform-google-modules/org-policy/google"
  constraint = "constraints/compute.restrictVpcPeering"
  policy_type = "list"
  policy_for = "project"  
  project_id = local.project_id
  enforce = false  
}

module "org-policy-vmCanIpForward" {
  source = "terraform-google-modules/org-policy/google"
  constraint = "constraints/compute.vmCanIpForward"
  policy_type = "list"
  policy_for = "project"
  project_id = local.project_id
  enforce = false  
}

module "org-policy-uniformBucketLevelAccess" {
  source = "terraform-google-modules/org-policy/google"
  constraint = "constraints/storage.uniformBucketLevelAccess"
  policy_type = "boolean"
  policy_for = "project"
  project_id = local.project_id
  enforce = false  
}