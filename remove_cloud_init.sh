#!/bin/bash

# Exit immediately on error
set -e

echo "Disabling cloud-init..."

# Prevent cloud-init from running again
sudo touch /etc/cloud/cloud-init.disabled

# Optional: disable cloud-init network configuration
echo "Disabling cloud-init network config..."
echo "network: {config: disabled}" | sudo tee /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg > /dev/null

echo "Removing cloud-init and related files..."
sudo apt purge -y cloud-init
sudo rm -rf /etc/cloud /var/lib/cloud

echo "Cleaning up cloud-init netplan config if it exists..."
if [ -f /etc/netplan/50-cloud-init.yaml ]; then
    sudo rm -f /etc/netplan/50-cloud-init.yaml
    sudo netplan generate
    sudo netplan apply
fi

echo "Cloud-init has been removed successfully."
echo "It is recommended to reboot the system now."