#!/bin/bash
set -e

# Directory to store Jenkins plugins
REF_DIR="/usr/share/jenkins/ref/plugins"
mkdir -p $REF_DIR

# Function to install a plugin if it doesn't already exist
installPlugin() {
  if [ ! -f "$REF_DIR/$1.jpi" ]; then
    echo "Installing plugin: $1 version: $2"
    curl -L --silent --show-error -f https://updates.jenkins.io/download/plugins/$1/$2/$1.hpi -o "$REF_DIR/$1.jpi"
  else
    echo "Plugin $1 is already installed."
  fi
}

# Install required plugins with specified versions
installPlugin git 4.7.2
installPlugin matrix-auth 2.6.8
installPlugin workflow-aggregator 2.6
installPlugin docker-workflow 1.26
installPlugin blueocean 1.24.7
installPlugin credentials-binding 1.24
