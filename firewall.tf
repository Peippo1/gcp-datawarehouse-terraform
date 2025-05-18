


resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh-access"]

  source_ranges = ["0.0.0.0/0"]

  description = "Allow SSH from anywhere to instances with 'ssh-access' tag"
}