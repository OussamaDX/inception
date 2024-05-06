FROM debian:bullseye


RUN apt-get update && apt-get upgrade

RUN apt-get -y install wget

RUN apt-get install -y php7.4\
	php-fpm\
	php-mysql\
	mariadb-client

RUN mkdir -p /var/www/html

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html

RUN cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chmod -R 644 /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g" /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/auto_script.sh  /var/www/html/wordpress

RUN chmod 755 /var/www/html/wordpress/auto_script.sh

EXPOSE 9000

WORKDIR /var/www/html/wordpress

RUN  chown -R www-data:www-data /var/www/*

RUN chmod -R 755 /var/www/*

CMD [ "bash", "/var/www/html/wordpress/auto_script.sh" ]
