#!/bin/bash

#Template parameters
NAME=$1
DB_PORT=$2
WP_PORT=$3
DB_ROOT_PASSWORD=$4
DB_PASSWORD=$5

cat  << EOF
version: '2'

services:
  ${NAME}_mysql:
    image: mysql:8.0.19
    restart: always
    command: --default-authentication-plugin=mysql_native_password
    container_name: ${NAME}_mysql
    environment:
      - MYSQL_ROOT_PASSWORD=${DB_ROOT_PASSWORD}
      - MYSQL_DATABASE=${NAME}Db
      - MYSQL_USER=${NAME}
      - MYSQL_PASSWORD=${DB_PASSWORD}
    ports:
      - '${DB_PORT}:3306'
    volumes:
      - $HOME/Docker/${NAME}/datadir:/var/lib/mysql
  ${NAME}_wp:
    image: wordpress
    restart: always
    container_name: ${NAME}_wp
    environment:
      - WORDPRESS_DB_HOST=${NAME}_mysql
      - WORDPRESS_DB_USER=${NAME}
      - WORDPRESS_DB_PASSWORD=${DB_PASSWORD}
      - WORDPRESS_DB_NAME=${NAME}Db
    ports:
      - '${WP_PORT}:80'
    volumes:
      - $HOME/Docker/${NAME}/wpdir:/var/www/html
    depends_on:
      - ${NAME}_mysql

networks:
  default:
    external:
      name: primary
EOF
