output "dataset_id" {
  value = google_bigquery_dataset.main.dataset_id
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.warehouse_staging.name}"
}