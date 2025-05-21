#!/bin/bash

# Update package index
echo "Updating package index..."
sudo apt update

# Install MySQL Server
echo "Installing MySQL Server..."
sudo apt install -y mysql-server

# Enable MySQL to start on boot
echo "Enabling MySQL to start on boot..."
sudo systemctl enable mysql

# Start MySQL service
echo "Starting MySQL service..."
sudo systemctl start mysql

# Run mysql_secure_installation non-interactively
echo "Running mysql_secure_installation..."

# Set MySQL root password
ROOT_PASSWORD="MyStrongRootP@ssw0rd!"

sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

# Secure MySQL installation
sudo mysql -uroot -p"${ROOT_PASSWORD}" <<EOF
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

echo "MySQL installation and basic security setup complete."
