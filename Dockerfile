FROM directus/directus:v8-apache

# ENV DIRECTUS_APP_ENV=production
# ENV DIRECTUS_AUTH_PUBLICKEY=some\ random\ secret
# ENV DIRECTUS_AUTH_SECRETKEY=another\ random\ secret
# ENV DIRECTUS_DATABASE_HOST=34.107.93.194
# ENV DIRECTUS_DATABASE_PORT=3306
# ENV DIRECTUS_DATABASE_NAME=sensocms
# ENV DIRECTUS_DATABASE_USERNAME=sensocms
# ENV DIRECTUS_DATABASE_PASSWORD=sensocms

# ENV DIRECTUS_INSTALL_TITLE=sensocms
# ENV DIRECTUS_INSTALL_EMAIL=email@example.com
# ENV DIRECTUS_INSTALL_PASSWORD=d1r3ctu5
# ENV DIRECTUS_INSTALL_FORCE=true

ENV DIRECTUS_USE_ENV=0

STOPSIGNAL SIGWINCH

RUN rm /var/directus/config/*

COPY data/config /var/directus/config
COPY data/uploads /var/directus/public/uploads

EXPOSE 80
CMD ["apache2-foreground"]