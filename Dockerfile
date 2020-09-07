FROM wordpress
RUN apt-get update
RUN apt-get install -y nano proftpd
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN wp plugin install really-simple-ssl --activate --allow-root
RUN wp rsssl activate_ssl --allow-root