output "service_account_outputs" {
  value = { for key, value in google_service_account.default : key => {
    email = value.email
  } }
}
