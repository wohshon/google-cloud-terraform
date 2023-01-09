# modules / networks
output "network" {
  value = module.vpc.network
}

output "vpc" {
  value = module.vpc
}

output "subnets" {
  value = module.vpc.subnets
}

