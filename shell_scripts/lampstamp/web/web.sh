#!/usr/bin/env bash

set -e
set -u

# Update the APT cache
sudo apt update

# Upgrade
sudo apt -y upgrade

# Install Apache2
sudo apt install apache2
