resource "google_compute_instance" "linux_admin_vm" {
  name         = "linux-admin-vm"
  machine_type = "e2-standard-2"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = file("startup.sh")

  tags = ["ssh-access"]

  service_account {
    email  = google_service_account.terraform_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
} 