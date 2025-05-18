#!/bin/bash
apt-get update
apt-get install -y ufw
ufw default deny incoming
ufw allow ssh
ufw --force enable
