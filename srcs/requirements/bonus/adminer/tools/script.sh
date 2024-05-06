#!bin/bash

wget "http://www.adminer.org/latest.php" -O usr/share/apache2/default-site/adminer.php 

chown -R www-data:www-data usr/share/apache2/default-site/adminer.php 

chmod 755 usr/share/apache2/default-site/adminer.php 

cd usr/share/apache2/default-site/adminer.php

rm -rf index.html

php -S 0.0.0.0:8080