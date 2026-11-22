#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
ip route replace default via 10.0.2.2
apt-get update
apt-get install -y ufw
ufw --force reset
ufw default deny incoming
ufw default deny outgoing
ufw allow from 10.0.2.0/24 to any port 22 proto tcp
ufw allow from 192.168.20.11 to any port 3306 proto tcp
ufw allow from 192.168.20.12 to any port 3306 proto tcp
ufw --force enable
ip route del default || true
