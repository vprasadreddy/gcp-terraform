variable "storage_bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

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
