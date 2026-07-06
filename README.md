# GCP Terraform

## Run Terraform with OIDC in GCP

These steps explain how to run Terraform from GitHub Actions or another CI system using Workload Identity Federation (OIDC) and the IAM roles required for the service account.

### 1. OIDC Setup

Follow this article on how to setup [GitHub Actions with OIDC](https://medium.com/@prasad.reddy0708/authenticate-to-google-cloud-gcp-from-github-actions-using-oidc-and-workload-identity-federation-2a6c6b56c29f)

### 2. Grant project-level permissions to the Service Account

Use a broad role for initial setup:

```bash
gcloud projects add-iam-policy-binding GCP_PROJECT_ID \
--member="serviceAccount:SERVICE_ACCOUNT_NAME@GCP_PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/editor"
```

> If you want a more restrictive setup, you can use a custom role later, but `roles/editor` is the simplest starting point.

### 3. Grant storage bucket permissions

For the Terraform state bucket, the service account needs object access. For example:

```bash
gcloud projects add-iam-policy-binding GCP_PROJECT_ID \
--member="serviceAccount:SERVICE_ACCOUNT_NAME@GCP_PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/storage.objectCreator"
```

Access to read Backend state if the Terraform State file is already created:

```bash
gcloud storage buckets add-iam-policy-binding gs://YOUR_STATE_BUCKET \
--member="serviceAccount:SERVICE_ACCOUNT_NAME@GCP_PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/storage.objectViewer"
```

### 4. Configure the Terraform backend

This repository already uses a GCS backend in [backend.tf](backend.tf). Update the bucket name to your own GCS bucket:

```hcl
terraform {
  backend "gcs" {
    bucket = "YOUR_STATE_BUCKET"
    prefix = "gcp-terraform"
  }
}
```

## Recommended minimum roles

- Project-level: `roles/editor`
- State bucket: `roles/storage.objectCreator` plus `roles/storage.objectViewer`
