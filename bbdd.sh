#!/bin/bash
DB_NAME="practica_db"
DB_USER="web_user"
DB_PASS="Web_2026_Marcos"
BBDD_IP="192.168.20.10"
WEB1_IP="192.168.20.11"
WEB2_IP="192.168.20.12"

export DEBIAN_FRONTEND=noninteractive

# Instala MariaDB
apt-get update
apt-get install -y mariadb-server

# Escucha en la IP de la red de datos
sed -i "s/^bind-address.*/bind-address = ${BBDD_IP}/" /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb

# Crea la base de datos y un usuario para cada servidor web (solo desde su IP)
mysql <<SQL
CREATE DATABASE IF NOT EXISTS ${DB_NAME} CHARACTER SET utf8mb4;
CREATE USER IF NOT EXISTS '${DB_USER}'@'${WEB1_IP}' IDENTIFIED BY '${DB_PASS}';
CREATE USER IF NOT EXISTS '${DB_USER}'@'${WEB2_IP}' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${WEB1_IP}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${WEB2_IP}';
FLUSH PRIVILEGES;
SQL
