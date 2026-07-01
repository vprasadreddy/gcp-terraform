# Multiple storage buckets using List

resource "google_storage_bucket" "my_bucket" {
  # count = length(var.storage_bucket_names)
  # name  = "${var.storage_bucket_name}-${count.index}"
  # name = var.storage_bucket_names[count.index]
  for_each                    = toset(var.storage_bucket_names)
  name                        = each.value
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

module "storage-bucket" {
  source                                     = "./modules-without-for-each/storage-bucket"
  for_each                                   = var.storage_buckets
  storage_bucket_name                        = each.value.storage_bucket_name
  storage_bucket_location                    = each.value.storage_bucket_location
  storage_bucket_force_destroy               = each.value.storage_bucket_force_destroy
  storage_bucket_uniform_bucket_level_access = each.value.storage_bucket_uniform_bucket_level_access
}

module "service-account" {
  source           = "./modules-with-for-each/service-account"
  service_accounts = var.service_accounts
}

module "compute-engine" {
  source     = "./modules-with-for-each/compute-engine"
  vms        = var.vms
  depends_on = [module.service-account]
}

# Get URL of Single Storage Bucket when using for_each with Module
output "individual_storage_bucket_url" {
  value = module.storage-bucket["storage_bucket-1"].storage_bucket_url
}

# Access all storage_bucket_urls as a map
output "all_storage_bucket_urls_as_map" {
  value = { for key, value in module.storage-bucket : key => value.storage_bucket_url }
}

# Get all storage_bucket_urls as a list using splat operator
output "all_storage_bucket_urls_as_list" {
  value = values(module.storage-bucket)[*].storage_bucket_url
}

# Module outputs
output "service_account_outputs" {
  value = module.service-account.service_account_outputs
}

# Module outputs using splat operator
output "service_account_outputs_emails_with_splat_operator" {
  value = values(module.service-account.service_account_outputs)[*].email
}
