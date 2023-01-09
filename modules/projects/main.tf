# uses project factory module 
# get input variables
locals {
    project_name = var.project_name
    project_id= var.project_id
    folder_id = var.folder_id
    billing_account = var.billing_account
    org_id = var.org_id
}

module "project-factory" {
    source  = "terraform-google-modules/project-factory/google"
    # version = "13.0.0"
    name = local.project_name
    project_id = local.project_id
    # current version assumes projects are in a folder 
    org_id = local.org_id
    folder_id = local.folder_id
    # TODO, cater for folder or org id
    billing_account = local.billing_account
    # use default values for service accounts so default service accounts will be disabled.
}

# enable services

resource "google_project_service" "container" {
  project = var.project_id
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

# Wait for the new configuration to propagate
# (might be redundant)
resource "time_sleep" "wait_project_init" {
  create_duration = "60s"

  depends_on = [google_project_service.container,google_project_service.compute ]
}

# https://stackoverflow.com/questions/59055395/can-i-automatically-enable-apis-when-using-gcp-cloud-with-terraform
#
/*
resource "google_project_service" "container" {
  project = var.project_id
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "compute" {
  project = var.project_id
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
#
*/