resource "yandex_compute_instance" "vm-1" {
  name        = "chapter5-lesson2-std-009-047"
  zone        = var.zone
  platform_id = var.platform_id
  resources {
    cores  = var.core_count
    memory = var.memory_value
  }

  scheduling_policy {
    preemptible = false
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.instance_subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("userdata.yaml")}"
    #ssh-keys = "ubuntu:${file("~/.ssh/id_rsa_ed25519.pub")}"

  }

}