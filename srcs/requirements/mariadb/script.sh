#!/bin/bash

service mariadb start

sleep 5;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

service mariadb stop

sleep 5

mysqld_safe