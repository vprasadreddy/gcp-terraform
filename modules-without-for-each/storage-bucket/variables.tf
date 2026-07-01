variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

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
