#!/bin/bash

# Check if /var/opt exists. If not create it.
if [ ! -d "/var/opt" ]; then
  sudo mkdir /var/opt
fi

# Check if /var/opt/jiinxt exists. If it does, delete it.
if [ -d "/var/opt/jiinxt" ]; then
  sudo rm -rf /var/opt/jiinxt
fi

# Check if /usr/local/bin/jiinxt exists. If it does, delete it.
if [ -f /usr/local/bin/jiinxt ]; then
    sudo rm /usr/local/bin/jiinxt
fi

# Move all files and set permissions.
sudo mv jiinxt /var/opt/jiinxt
sudo mv runner.sh /usr/local/bin/jiinxt
sudo chmod +x /usr/local/bin/jiinxt