data "google_service_account" "object_viewer" {
  for_each   = var.vms
  account_id = each.value.service_account_id
}

resource "google_compute_instance" "gcp_vm" {
  for_each     = var.vms
  name         = each.value.vm_instance_name
  machine_type = each.value.vm_instance_machine_type
  zone         = each.value.vm_instance_zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = data.google_service_account.object_viewer[each.key].email
    scopes = ["cloud-platform"]
  }
  depends_on = [data.google_service_account.object_viewer]
}
