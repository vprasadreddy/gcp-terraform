variable "storage_account_location" {
  description = "The location of the storage account."
  type        = string
}

variable "storage_account_force_destroy" {
  description = "Whether to force destroy the storage account."
  type        = bool
}

variable "storage_account_uniform_bucket_level_access" {
  description = "Whether to enable uniform bucket-level access."
  type        = bool
}

variable "storage_account_names" {
  description = "The names for storage accounts."
  type        = list(string)
}

variable "storage_accounts" {
  description = "The ID of the service account."
  type = map(object({
    storage_account_name                        = string
    storage_account_location                    = string
    storage_account_force_destroy               = bool
    storage_account_uniform_bucket_level_access = bool
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



