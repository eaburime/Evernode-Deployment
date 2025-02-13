#!/bin/bash

# Evernode Deployment Script (Python 3.6, Ubuntu 22.04)
# Author: Ehi Aburime (@eaburime)
# Purpose: Automates Evernode installation & setup on XRPL Ledger

echo "🚀 Starting Evernode deployment on Ubuntu 22.04..."

# Take Me Later - Automating future improvements 🚀

# Update system packages
echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "⚙️ Installing dependencies (build tools, Python, NGINX, uWSGI)..."
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev nginx nginx-extras

# Download & install Python 3.6.5 (if not already installed)
echo "🐍 Installing Python 3.6.5..."
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz
tar xvf Python-3.6.5.tar.xz
cd Python-3.6.5
./configure --enable-optimizations --with-ensurepip=install
make -j8
sudo make altinstall
cd ..

# Set Python 3.6 as the default version
echo "🔗 Updating Python alternatives..."
sudo update-alternatives --install /usr/bin/python python /usr/local/bin/python3.6 50

# Install Evernode
echo "📦 Installing Evernode..."
pip install evernode

# Install uWSGI (WSGI server for Python apps)
echo "🛠 Installing uWSGI..."
pip install uwsgi

# Start NGINX
echo "🌐 Starting NGINX..."
sudo systemctl enable nginx
sudo systemctl start nginx

echo "✅ Evernode deployment completed!"
echo "📌 To check installation: run 'evernode --version'"
