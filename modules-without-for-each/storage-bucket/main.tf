resource "google_storage_bucket" "storage_bucket" {
  name                        = var.storage_bucket_name
  location                    = var.storage_bucket_location
  force_destroy               = var.storage_bucket_force_destroy
  uniform_bucket_level_access = var.storage_bucket_uniform_bucket_level_access

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 30
    }
  }
}
