variable "snapshot_name" {
  default = "ubuntu-k3s-{{timestamp}}"
}

variable "do_token" {
  description = "DigitalOcean Personal Access Token"
  type        = string
}

variable "base_system_image" {
  type = string
  default = "ubuntu-24-04-x64"
}

variable "region" {
  type    = string
  default = "nyc3"

}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "tags" {
  type    = list(string)
  default = ["ubuntu", "k3s"]
}

// TODO - Replace with key info
// This is for the first run build
variable "ssh_username" {
  type    = string
  default = "root"
}

variable "ssh_password" {
  type = string
}
