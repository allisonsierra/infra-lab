data "digitalocean_ssh_key" "ssh_key_automation" {
  name = "Automation"
}

resource "digitalocean_droplet" "k3s-demo" {
  image  = "ubuntu-24-04-x64"
  name   = "k3s-demo"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key_allie.id,
    data.digitalocean_ssh_key.ssh_key_automation.id
  ]
  volume_ids = [
    data.digitalocean_volume.k3s-demo.id,
    data.digitalocean_volume.k3s-demo.id
  ]
  graceful_shutdown = true

}

resource "digitalocean_floating_ip" "k3s-demo" {
  droplet_id = digitalocean_droplet.k3s-demo.id
  region     = digitalocean_droplet.k3s-demo.region
}

resource "digitalocean_container_registry" "registry" {
  name                   = var.project_name
  subscription_tier_slug = "starter"
  region                 = "nyc3"
}


data "digitalocean_ssh_key" "ssh_key_allie" {
  name = "Allie Laptop"
}


data "digitalocean_ssh_key" "ssh_key_automation" {
  name = "Automation"
}

data "digitalocean_volume" "k3s-demo" {
  name = "k3s-demo"
}

