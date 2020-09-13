#!/bin/bash

dir="$(dirname "$0")"

read -p "Introduzca el nombre del nuevo servicio Wordpress: " name
read -p "Introduzca el puerto para la nueva base de datos: " dbport
read -p "Introduzca el puerto para el servicio Wordpress: " wpport
read -p "Introduzca la contraseña de administrador de MySql: " dbrootpass
read -p "Introduzca la contraseña para MySql: " dbpass
mkdir $HOME/Docker/$name
$dir/wordpressTemplate.sh $name $dbport $wpport $dbrootpass $dbpass > $HOME/Docker/$name/docker-compose.yml
docker-compose -f $HOME/Docker/$name/docker-compose.yml up -d
sleep 15
echo "Wordpress se ha instalado correctamente. Para continuar acceda al sevicio y siga las instrucciones del asistente de inicialización de Wordpress"
read -n 1 -p "Presione cualquier tecla cuando esté listo"
echo "Acceda a los ajustes generales y configure las URL con https"
read -n 1 -p "Presione cualquier tecla cuando esté listo"
docker cp $dir/wordpress-docker-ready/wp_initializer.sh ${name}_wp:/wp_initializer.sh
docker exec ${name}_wp /wp_initializer.shy
echo "Tu nuevo Wordpress ya está listo para funcionar con SSL"
echo "Configura el proxy inverso para que redireccione y funcione con HTTPS"
