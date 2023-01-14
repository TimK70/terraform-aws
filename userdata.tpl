#!/bin/bash
sudo apt -y update
sudo apt -y install apache2
systemctl start apache2
systemctl enable apache2
