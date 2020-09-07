FROM wordpress

ADD wp-initializer.sh wp-initializer.sh
RUN echo "Si vas a usar Wordpress con SSL, acceded al contenedor y ejecuta el script wp-initializer.sh"
ENTRYPOINT [ "wp-initializer.sh" ]