terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

provider "yandex" {
  token     = "t1.9euelZrKisydnpSZx46djZrOjpnKjO3rnpWalJWZlJTOmcabnpKPx5zJnpfl9PdwPQZl-e97Ewbb3fT3MGwDZfnvexMG2w.6cKb1VjvvWy0fEZpDWviW8ZYg9L9O_Bo1E1bbrpwbNrAc81lB_GmEyzwJO11MSmgX1K67LiviHREouqhozC1Ag"
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gt260mflvge5lvm7ge"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-std-009-047"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80qm01ah03dkqb14lc"
    }
  }

  network_interface {
    subnet_id = "e9bg8cjovk4tpbk8h6m7"
    nat       = true
  }

  metadata = {
    user-data = "${file("userdata.yaml")}"
	#ssh-keys = "ubuntu:${file("~/.ssh/id_rsa_ed25519.pub")}"

  }

}


output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}