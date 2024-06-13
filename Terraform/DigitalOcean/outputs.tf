# Server Information
output "Name" {
    value = digitalocean_droplet.server.*.name
}
output "IPv4-Public" {
    value = digitalocean_droplet.server.*.ipv4_address
}
output "IPv4-Private" {
    value = digitalocean_droplet.server.*.ipv4_address_private
}