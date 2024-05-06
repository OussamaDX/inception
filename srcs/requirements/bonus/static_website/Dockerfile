FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

RUN mkdir -p /www/var/web

COPY ./tools/ooussaad /var/www/web

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]