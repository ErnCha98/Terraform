output "network_link" {
  value = google_compute_network.main.self_link
}
output "subnet_link" {
  value = google_compute_subnetwork.private.self_link
}

output "subnet_id" {
  value = google_compute_subnetwork.private.id
}

output "network_id" {
    value = google_compute_network.main.id
}