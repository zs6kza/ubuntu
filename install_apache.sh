#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package list..."
sudo apt update

echo "Installing Apache2..."
sudo apt install -y apache2

echo "Enabling and starting Apache2 service..."
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Allowing HTTP traffic through the firewall (if UFW is active)..."
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow 'Apache'
fi

echo "Apache2 installation complete. You can check the status with:"
echo "  sudo systemctl status apache2"