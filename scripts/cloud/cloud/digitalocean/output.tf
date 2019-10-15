output "server_id" {
  value = "${digitalocean_droplet.main.id}"
}

output "ipv4" {
  value = "${digitalocean_droplet.main.ipv4_address}"
}

