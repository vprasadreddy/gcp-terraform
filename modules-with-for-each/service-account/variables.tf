# variable "service_account_id" {
#   description = "The ID of the service account."
#   type        = string
# }

# variable "service_account_display_name" {
#   description = "The display name of the service account."
#   type        = string
# }

variable "service_accounts" {
  type = map(object({
    service_account_id           = string
    service_account_display_name = string
  }))
}
