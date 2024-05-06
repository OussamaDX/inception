FROM debian:bullseye

RUN mkdir -p /etc/nginx/ssl

RUN apt update && apt install -y nginx

RUN apt install -y openssl

RUN mkdir -p /etc/ssl/private/

RUN mkdir -p /etc/ssl/certs/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=MO/L=BG/O=1337/OU=student/CN=ooussaad"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]


#undrtsand this docker file 