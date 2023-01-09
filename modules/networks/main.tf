# modules / networks
# https://registry.terraform.io/modules/terraform-google-modules/network/google/5.1.0

locals {
    project_id = var.project_id
    network_name = var.network_name
    routing_mode = var.routing_mode
    subnet_names = var.subnet_names
    subnet_ips = var.subnet_ips
    subnet_desc = var.subnet_desc
    region = var.region
    ip_range_pods = var.ip_range_pods
    ip_range_services = var.ip_range_services
    ip_range_pods_name = var.ip_range_pods_name
    ip_range_services_name = var.ip_range_services_name
    
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    # version = "~> 4.0"

    project_id   = "${local.project_id}"
    network_name = "${local.network_name}"
    routing_mode = "${local.routing_mode}"


    subnets = [
        {
            subnet_name           = local.subnet_names[0]
            subnet_ip             = local.subnet_ips[0]
            subnet_region         = local.region
            description           = local.subnet_desc[0]

        },
        {
            subnet_name           = local.subnet_names[1]
            subnet_ip             = local.subnet_ips[1]
            subnet_region         = local.region
            description           = local.subnet_desc[1]
        },
        {
            subnet_name           = local.subnet_names[2]
            subnet_ip             = local.subnet_ips[2]
            subnet_region         = local.region
            description           = local.subnet_desc[2]
            # subnet_private_access = "true"
            # subnet_flow_logs      = "true"
            # description           = "This subnet has a description"
        }
    ]
    secondary_ranges = {
    "${local.subnet_names[1]}" = [ #for app tier
      {
        range_name    = local.ip_range_pods_name
        ip_cidr_range = local.ip_range_pods
      },
      {
        range_name    = local.ip_range_services_name
        ip_cidr_range = local.ip_range_services
      },
    ]
  }
}