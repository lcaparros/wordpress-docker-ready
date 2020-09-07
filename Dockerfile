FROM wordpress
ENV URL yourwebsite.com
ENV TITLE "Your Blog Title"
ENV ADMIN_USERNAME admin
ENV ADMIN_PASSWORD admin
ENV ADMIN_EMAIL admin@email.com
ADD wp-initializer.sh wp-initializer.sh
RUN ./wp-initializer.sh
RUN rm wp-initializer.sh