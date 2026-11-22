#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Instala Apache y PHP con soporte para MariaDB
apt-get update
apt-get install -y apache2 php libapache2-mod-php php-mysql

# Página de prueba: muestra el nombre del servidor y comprueba la base de datos
rm -f /var/www/html/index.html
cat > /var/www/html/index.php <<'PHP'
<?php
mysqli_report(MYSQLI_REPORT_OFF);
echo "<h1>Servidor web: " . gethostname() . "</h1>";
$c = @mysqli_connect('192.168.20.10', 'web_user', 'Web_2026_Marcos', 'practica_db');
echo $c ? "<p>Conexión con la base de datos: OK</p>" : "<p>Conexión con la base de datos: ERROR</p>";
PHP

systemctl restart apache2
