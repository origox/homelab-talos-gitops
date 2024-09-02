# homelab-talos-gitops
Mono repo for my homelab configuration

# Setup

1. Provision VMs

````bash
# Download Talos base image to Proxmox
task provision:download-talos-to-proxmox

# Provision VMs for Talos Cluster nodes 3 controlplane and 3 worker nodes
task provision:create-talos-vms

```