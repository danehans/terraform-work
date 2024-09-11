#!/usr/bin/env bash

set -ex

terraform init
terraform apply -auto-approve

# Wait until docker is available on the VM

while ! gcloud compute ssh --project solo-oss dhansen --zone us-west4-b -- docker ps; do
  sleep 5
done

# Copy ~/.ssh/gcp-key to the VM
gcloud compute scp --project solo-oss ~/.ssh/gcp-key dhansen:~/.ssh/id_rsa --zone us-west4-b
gcloud compute ssh dhansen --project solo-oss --zone us-west4-b -- 'chmod 600 ~/.ssh/id_rsa'

# Setup dot files and shell
#gcloud compute ssh dhansen --project solo-oss --zone us-west4-b -- 'git clone git@github.com:dhansen/dotfiles.git ~/dev/dotfiles'
#gcloud compute ssh dhansen --project solo-oss --zone us-west4-b -- 'cd ~/dev/dotfiles && ./install.sh'
#gcloud compute ssh dhansen --project solo-oss --zone us-west4-b -- 'sudo usermod -s /usr/bin/zsh daniel'

set +ex

echo "VM is setup. Use \$(gcloud compute ssh dhansen --project solo-oss --zone us-west4-b) to connect."
