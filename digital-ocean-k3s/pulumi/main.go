package main

import (
	"github.com/pulumi/pulumi-digitalocean/sdk/v4/go/digitalocean"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		// Create a DigitalOcean resource (Droplet)
		_, err := digitalocean.NewDroplet(ctx, "droplet", &digitalocean.DropletArgs{
			Name:   pulumi.String("pulumi-droplet"),
			Image:  pulumi.String("ubuntu-24-04-x64"),
			Size:   pulumi.String(digitalocean.DropletSlugDropletS1VCPU1GB),
			Region: pulumi.String(digitalocean.RegionNYC3),
		})
		if err != nil {
			return err
		}
		return nil
	})
}
