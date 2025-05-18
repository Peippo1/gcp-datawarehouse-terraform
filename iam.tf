
# Create a service account
resource "google_service_account" "terraform_sa" {
  account_id   = "terraform-service"
  display_name = "Terraform Service Account"
}

# Grant Storage Object Viewer role on the GCS bucket
resource "google_storage_bucket_iam_member" "bucket_viewer" {
  bucket = google_storage_bucket.warehouse_staging.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.terraform_sa.email}"
}

# Grant BigQuery Data Viewer role on the BigQuery dataset
resource "google_bigquery_dataset_iam_member" "bq_viewer" {
  dataset_id = google_bigquery_dataset.main.dataset_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${google_service_account.terraform_sa.email}"
}