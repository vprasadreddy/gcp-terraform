resource "google_storage_bucket" "storage_bucket" {
  name                        = var.storage_account_name
  location                    = var.storage_account_location
  force_destroy               = var.storage_account_force_destroy
  uniform_bucket_level_access = var.storage_account_uniform_bucket_level_access

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 30
    }
  }
}
