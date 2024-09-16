source "digitalocean" "ubuntu-k3s" {
  snapshot_name = var.snapshot_name
  api_token     = var.do_token
  image         = var.base_system_image
  region        = var.region
  size          = var.droplet_size
  tags          = var.tags
  ssh_username  = var.ssh_username
  ssh_password  = var.ssh_password
}



build {
  sources = ["source.digitalocean.ubuntu-k3s"]

  provisioner "shell" {
    inline = [
      "ls -la",

  }
}