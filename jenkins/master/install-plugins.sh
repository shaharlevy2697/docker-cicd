#!/bin/bash
set -e

REF_DIR="/usr/share/jenkins/ref/plugins"
mkdir -p $REF_DIR

installPlugin() {
  if [ ! -f "$REF_DIR/$1.jpi" ]; then
    curl -L --silent --show-error -f https://updates.jenkins.io/download/plugins/$1/$2/$1.hpi -o "$REF_DIR/$1.jpi"
  fi
}

installPlugin git 4.7.2
installPlugin matrix-auth 2.6.8
installPlugin workflow-aggregator 2.6
installPlugin docker-workflow 1.26
installPlugin blueocean 1.24.7
installPlugin credentials-binding 1.24
