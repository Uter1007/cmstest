FROM directus/directus:v8-apache

ENV DIRECTUS_USE_ENV=0

STOPSIGNAL SIGWINCH

RUN rm /var/directus/config/*

COPY data/config /var/directus/config
COPY data/uploads /var/directus/public/uploads

EXPOSE 80
CMD ["apache2-foreground"]