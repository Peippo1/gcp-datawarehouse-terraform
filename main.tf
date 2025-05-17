terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_bigquery_dataset" "main" {
  dataset_id                 = var.dataset_id
  friendly_name              = "My Data Warehouse"
  description                = "Terraform-managed BQ dataset"
  location                   = var.region
  delete_contents_on_destroy = true
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "warehouse_staging" {
  # Construct a globally unique bucket name
  name          = "${var.project_id}-warehouse-staging-${random_id.bucket_suffix.hex}"
  location      = var.region
  force_destroy = true
}

# Added to test 