#!/bin/bash

# Exit on any error
set -e

# Define custom HTML content
HTML_CONTENT='<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Custom Site</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f4f4f4; color: #333; text-align: center; padding: 50px; }
    h1 { color: #007BFF; }
  </style>
</head>
<body>
  <h1>Welcome to My Custom Website</h1>
  <p>This is a custom landing page served by Apache2.</p>
</body>
</html>'

# Apache default web root
WEBROOT="/var/www/html"

# Create index.html with custom content
echo "Creating custom index.html..."
echo "$HTML_CONTENT" | sudo tee "$WEBROOT/index.html" > /dev/null

# Set permissions (optional, just to be safe)
sudo chown www-data:www-data "$WEBROOT/index.html"
sudo chmod 644 "$WEBROOT/index.html"

# Restart Apache to apply changes
echo "Restarting Apache2..."
sudo systemctl restart apache2

# Confirm success
echo "✅ Custom website deployed at http://localhost or your server's IP"
