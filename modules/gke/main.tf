# modules/gke
# https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest



locals {
    project_id = var.project_id
    network_name = var.network_name
    subnet_names = var.subnet_names
    
    gke_cluster_name = var.gke_cluster_name

    service_account = var.service_account
    ip_range_pods_name = var.ip_range_pods_name
    ip_range_services_name = var.ip_range_services_name
    region = var.region
}

# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}


module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = local.project_id
  name                       = local.gke_cluster_name
  region                     = local.region
  zones                      = ["asia-southeast1-a", "asia-southeast1-b", "asia-southeast1-c"]
  network                    = local.network_name
  subnetwork                 = local.subnet_names[1] # app tier
  ip_range_pods              = local.ip_range_pods_name
  ip_range_services          = local.ip_range_services_name
  # http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  remove_default_node_pool = true
  # filestore_csi_driver       = false

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "e2-standard-2" # "e2-medium"
      node_locations            = "asia-southeast1-a,asia-southeast1-b,asia-southeast1-c"
      min_count                 = 1
      max_count                 = 2
      local_ssd_count           = 0
      spot                      = false
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = true
      service_account           = "${local.service_account}"
      preemptible               = false
      initial_node_count        = 1 # per zone
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}