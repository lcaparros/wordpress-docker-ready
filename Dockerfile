FROM wordpress
RUN apt-get update
RUN apt-get install nano proftpd
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp plugin install really-simple-ssl --activate
RUN wp rsssl activate_ssl