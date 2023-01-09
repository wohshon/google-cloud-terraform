# root module
region = "asia-southeast1"
network_name = "vpc-network-1"
routing_mode = "GLOBAL"
subnet_names = [ "subnet-web", "subnet-app", "subnet-db" ]
subnet_ips = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
subnet_desc = [ "web subnet", "app subnet", "db subnet" ]

# gke secondary range, for network module
ip_range_pods = "10.20.0.0/16"
ip_range_services = "10.30.0.0/16"
ip_range_pods_name = "ip-range-pods"
ip_range_services_name = "ip-range-services"
# service_accounts = []

gke_cluster_name = "gke-test-1"
