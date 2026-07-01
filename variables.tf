variable "storage_bucket_location" {
  description = "The location of the storage bucket."
  type        = string
}

variable "storage_bucket_force_destroy" {
  description = "Whether to force destroy the storage bucket."
  type        = bool
}

variable "storage_bucket_uniform_bucket_level_access" {
  description = "Whether to enable uniform bucket-level access."
  type        = bool
}

variable "storage_bucket_names" {
  description = "The names for storage buckets."
  type        = list(string)
}

variable "storage_buckets" {
  description = "The ID of the service account."
  type = map(object({
    storage_bucket_name                        = string
    storage_bucket_location                    = string
    storage_bucket_force_destroy               = bool
    storage_bucket_uniform_bucket_level_access = bool
  }))
}

variable "service_accounts" {
  type = map(object({
    service_account_id           = string
    service_account_display_name = string
  }))
}

variable "vms" {
  type = map(object({
    vm_instance_name         = string
    vm_instance_machine_type = string
    vm_instance_zone         = string
    service_account_id       = string
  }))
}



