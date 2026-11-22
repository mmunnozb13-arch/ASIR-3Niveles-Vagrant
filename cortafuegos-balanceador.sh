#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get install -y ufw
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow from 10.0.2.0/24 to any port 22 proto tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable
