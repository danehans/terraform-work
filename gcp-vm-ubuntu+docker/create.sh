#!/usr/bin/env bash

set -ex

terraform init
terraform apply -auto-approve

# Wait until docker is available on the VM

while ! gcloud compute ssh --project solo-oss dhawton --zone us-central1-a -- docker ps; do
  sleep 5
done

# Copy ~/.ssh/gcp-key to the VM
gcloud compute scp --project solo-oss ~/.ssh/gcp-key dhawton:~/.ssh/id_ed25519 --zone us-central1-a
gcloud compute ssh dhawton --project solo-oss --zone us-central1-a -- 'chmod 600 ~/.ssh/id_ed25519'

# Setup dot files and shell
gcloud compute ssh dhawton --project solo-oss --zone us-central1-a -- 'git clone git@github.com:dhawton/dotfiles.git ~/dev/dotfiles'
gcloud compute ssh dhawton --project solo-oss --zone us-central1-a -- 'cd ~/dev/dotfiles && ./install.sh'
gcloud compute ssh dhawton --project solo-oss --zone us-central1-a -- 'sudo usermod -s /usr/bin/zsh daniel'

set +ex

echo "VM is setup. Use $(gcloud compute ssh dhawton --project solo-oss --zone us-central1-a) to connect."
