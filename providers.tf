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

provider "google" {
  project = "project-65e3c309-4447-4e9b-81b"
  region  = "asia-south1"
}
