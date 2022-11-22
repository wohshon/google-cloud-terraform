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
        },
        {
            subnet_name           = local.subnet_names[3]
            subnet_ip             = local.subnet_ips[3]
            subnet_region         = local.region
            description           = local.subnet_desc[3]
        },
        {
            subnet_name           = local.subnet_names[4]
            subnet_ip             = local.subnet_ips[4]
            subnet_region         = local.region
            description           = local.subnet_desc[4]
        }
    ]
}