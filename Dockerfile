FROM directus/directus:v8-apache

ENV DIRECTUS_USE_ENV=0

STOPSIGNAL SIGWINCH

RUN rm /var/directus/config/*

COPY data/config /var/directus/config
COPY data/uploads /var/directus/public/uploads
COPY credentials.json /var/directus

RUN curl -o /usr/local/bin/cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 && chmod +x /usr/local/bin/cloud_sql_proxy

EXPOSE 80

COPY entry.sh /var/directus/

RUN chmod +x /var/directus/entry.sh

ENTRYPOINT ["/var/directus/entry.sh"]

CMD ["apache2-foreground"]