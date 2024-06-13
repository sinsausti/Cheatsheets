resource "digitalocean_droplet" "server" {
    count  = var.count
    image = var.image
    name = "server-${var.name}"
    region = var.region
    size = var.size
    ssh_keys = [data.digitalocean_ssh_key.terraform.id]
    tags = [var.tag]
    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "5m"
    }
    provisioner "file" {
        source      = "./keys/id_rsa"
        destination = "/root/.ssh/id_rsa"
    }
    provisioner "file" {
        source      = "./keys/id_rsa.pub"
        destination = "/root/.ssh/id_rsa.pub"
    }
    provisioner "file" {
        source      = "./keys/authorized_keys"
        destination = "/root/.ssh/authorized_keys"
    }

    provisioner "local-exec" {
        command = "sleep 5; echo '${self.name}' >> ./inventory; echo '${self.ipv4_address_private}' >> ./inventory"
    }

    provisioner "remote-exec" {
        inline = [
            "export PATH=$PATH:/usr/bin",
            "apt-get update -y",
            "chmod 600 /root/.ssh/id_rsa",
            "chmod 644 /root/.ssh/id_rsa.pub",
            "chmod 644 /root/.ssh/authorized_keys",
        ]
    }
}