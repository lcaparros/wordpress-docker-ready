FROM wordpress
ENV URL yourwebsite.com
ENV TITLE "Your Blog Title"
ENV ADMIN_USERNAME admin
ENV ADMIN_PASSWORD admin
ENV ADMIN_EMAIL admin@email.com
RUN apt-get update
RUN apt-get install -y nano proftpd
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN wp core install --url=$URL --title=$TITLE --admin_name=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
RUN wp plugin install really-simple-ssl --activate --allow-root
RUN wp rsssl activate_ssl --allow-root
