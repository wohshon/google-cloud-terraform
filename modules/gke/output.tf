# modules / gke

output "endpoint" {
  value = module.gke.endpoint
  description = "endpoint of GKE Cluster"
}

output "gke_cluster_id" {
  value = module.gke.cluster_id
  description = "Cluster ID of GKE Cluster"
}

output "location" {
    value = module.gke.location
    description = "Location of cluster, zonal or regional"
}

output "identity_namespace" {
    value = module.gke.identity_namespace
    description = "Workload Identity Pool"
}

output "gke_cluster_name" {
    value = module.gke.name
    description = "Cluster Name"
}
