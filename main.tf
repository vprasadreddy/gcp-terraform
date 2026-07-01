# Multiple storage buckets using List

resource "google_storage_bucket" "my_bucket" {
  # count = length(var.storage_account_names)
  # name  = "${var.storage_account_name}-${count.index}"
  # name = var.storage_account_names[count.index]
  for_each                    = toset(var.storage_account_names)
  name                        = each.value
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

module "storage-account" {
  source                                      = "./modules-without-for-each/storage-bucket"
  for_each                                    = var.storage_accounts
  storage_account_name                        = each.value.storage_account_name
  storage_account_location                    = each.value.storage_account_location
  storage_account_force_destroy               = each.value.storage_account_force_destroy
  storage_account_uniform_bucket_level_access = each.value.storage_account_uniform_bucket_level_access
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

# Module outputs
output "storage_bucket_urls" {
  value = values(module.storage-account)[*].storage_bucket_url_outputs
}

# Module outputs
output "service_account_outputs" {
  value = module.service-account.service_account_outputs
}

# Module outputs using splat operator
output "service_account_outputs_emails_with_splat_operator" {
  value = values(module.service-account.service_account_outputs)[*].email
}
