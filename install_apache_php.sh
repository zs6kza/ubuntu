#!/bin/bash

# Exit on error
set -e

echo "Updating package list..."
sudo apt update

echo "Installing Apache2..."
sudo apt install -y apache2

echo "Installing PHP and common modules..."
sudo apt install -y php libapache2-mod-php php-cli php-mysql php-curl php-gd php-mbstring php-xml php-zip

echo "Enabling and starting Apache2 service..."
sudo systemctl enable apache2
sudo systemctl restart apache2

echo "Allowing HTTP traffic through UFW (if active)..."
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow 'Apache'
fi

echo "Creating PHP test file in /var/www/html/info.php..."
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php > /dev/null

echo "Apache + PHP installation complete."
echo "Visit http://<your-server-ip>/info.php to verify PHP is working."