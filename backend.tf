terraform {
  backend "gcs" {
    bucket = "terraform-state-demo-bucket-99" # change this to your GCS bucket name
    prefix = "gcp-terraform"                  # Change this to your desired prefix for the state files
  }
}
