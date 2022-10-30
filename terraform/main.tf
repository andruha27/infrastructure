module "tf-yc-instance" {
  source       = "./modules/tf-yc-instance"
  zone         = var.zone
  platform_id  = "standard-v1"
  image_id = "fd80qm01ah03dkqb14lc"
  core_count   = 2
  instance_subnet_id = module.tf-yc-network.yandex_vpc_subnets[var.zone].id
  memory_value = 4 
}

module "tf-yc-network" {
  source = "./modules/tf-yc-network"
  network_zones =    ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

output "ip_address_external" {
    value = "${module.tf-yc-instance.ip_address_external}"
}

output "ip_address_local" {
    value = "${module.tf-yc-instance.ip_address_local}"
}