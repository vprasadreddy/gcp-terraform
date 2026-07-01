resource "google_service_account" "default" {
  for_each = var.service_accounts
  # account_id   = var.service_account_id
  # display_name = var.service_account_display_name
  account_id   = each.value.service_account_id
  display_name = each.value.service_account_display_name
}
