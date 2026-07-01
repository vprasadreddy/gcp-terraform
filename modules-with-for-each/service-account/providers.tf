terraform {
  required_version = ">= 1.5.0"

  //GCP provider configuration
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}
