#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Instala Nginx
apt-get update
apt-get install -y nginx

# Quita el sitio por defecto y define el balanceo entre los dos servidores web
rm -f /etc/nginx/sites-enabled/default
cat > /etc/nginx/conf.d/balanceador.conf <<'NGINX'
upstream backend {
    server 192.168.10.11;
    server 192.168.10.12;
}
server {
    listen 80;
    server_name _;
    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
NGINX

nginx -t
systemctl restart nginx
