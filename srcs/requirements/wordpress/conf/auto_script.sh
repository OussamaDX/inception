#!/bin/bash

until mariadb -h mariadb -u $SQL_USER -p$SQL_PASSWORD -e ";"
do
    sleep 2
done

sed -i "s/\(define( 'DB_NAME', \).*$/\1'$SQL_DATABASE' );/" /var/www/html/wp-config.php;
sed -i "s/\(define( 'DB_USER', \).*$/\1'$SQL_USER' );/" /var/www/html/wp-config.php;
sed -i "s/\(define( 'DB_PASSWORD', \).*$/\1'$SQL_PASSWORD' );/" /var/www/html/wp-config.php;
sed -i "s/\(define( 'DB_HOST', \).*$/\1'mariadb:3306' );/" /var/www/html/wp-config.php;

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

wp core download --allow-root

# Update database configuration in wp-config.php

wp config create --allow-root --path='/var/www/html/wordpress' --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOST

wp core install --allow-root --path='/var/www/html/wordpress' --url=$DOMAIN --title=inception --admin_user=$SQL_USER --admin_password=$SQL_PASSWORD --admin_email=$ADMIN_EMAIL
wp user create --allow-root --path='/var/www/html/wordpress' $USER $USER@gmail.com --user_pass=$USER
fi

mkdir /run/php

exec php-fpm7.4 -F