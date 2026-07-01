storage_account_names                       = ["backend-storage-account", "frontend-storage-account", "database-storage-account"]
storage_account_location                    = "asia-south1"
storage_account_force_destroy               = false
storage_account_uniform_bucket_level_access = true


storage_accounts = {
  "storage_account-1" = {
    storage_account_name                        = "demo-storage-account-terraform"
    storage_account_location                    = "asia-south1"
    storage_account_force_destroy               = false
    storage_account_uniform_bucket_level_access = true
  }
  "storage_account-2" = {
    storage_account_name                        = "demo-storage-account-terraform2"
    storage_account_location                    = "asia-south1"
    storage_account_force_destroy               = true
    storage_account_uniform_bucket_level_access = true
  }
}

service_accounts = {
  "service_account-1" = {
    service_account_id           = "my-demo-cls-sa"
    service_account_display_name = "Demo Custom SA for VM Instance"
  }
}

vms = {
  "vm1" = {
    vm_instance_name         = "my-demo-vm-instance"
    vm_instance_machine_type = "n2-standard-2"
    vm_instance_zone         = "asia-south1-a"
    service_account_id       = "my-demo-cls-sa"
  }
}