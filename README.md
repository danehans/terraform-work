# Terraform Templates

Primary used for work, gives me some templates to use to quickly spin up infrastructure for development.

## Templates

### GKE

Soon(TM)

### VMs

- [gcp-vm-rhel](./gcp-vm-rhel) -- A simple RHEL VM in GCP that by default uses RHEL 8
- [gcp-vm-ubuntu](./gcp-vm-ubuntu) -- A simple Ubuntu VM in GCP that by default uses Ubuntu 24.04

The variables.tf files in the templates above mirror the full variables of the module, so that 
I can set per-template defaults and still override from the commandline.

See [modules/gcp-vm/variables.tf](./modules/gcp-vm/variables.tf) for the full list of variables.
