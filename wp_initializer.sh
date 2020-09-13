#!/bin/bash

apt-get update
apt-get install -y nano proftpd
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
echo "Es hora de inicializar Wordpress!"
echo "Accede a la URL dónde se haya publicado Wordpress y sigue el asistente de configuración inicial"
read  -n 1 -p "Pulsa cualquier tecla cuando esté listo"
wp plugin install really-simple-ssl --activate --allow-root
wp rsssl activate_ssl --allow-root
echo "Tu nuevo Wordpress ya está listo para funcionar con SSL"

