#!/bin/bash
# Ubuntu Server Hardening, UFW Firewall & Certbot SSL Setup
sudo apt update && sudo apt install ufw certbot python3-certbot-nginx -y

# Configure UFW Firewall rules
sudo ufw allow 22/tcp
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

# Hide Nginx version header
sudo sed -i 's/# server_tokens off;/server_tokens off;/' /etc/nginx/nginx.conf
sudo nginx -t && sudo service nginx reload
