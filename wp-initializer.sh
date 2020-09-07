#!/bin/bash

apt-get update
apt-get install -y nano proftpd
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core install --url=$URL --title=$TITLE --admin_name=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp plugin install really-simple-ssl --activate --allow-root
wp rsssl activate_ssl --allow-root
