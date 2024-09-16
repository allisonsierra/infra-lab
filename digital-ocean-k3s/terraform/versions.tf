terraform {
  required_version = ">= 1.9.5"

  cloud {
    organization = "my-team"

    workspaces {
      name = "demo-lab"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
