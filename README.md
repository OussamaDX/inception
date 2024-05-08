# inception


mysql -uroot // To connect on mysql CLI
SELECT User FROM mysql.user; // To see all the users
USE wordpress // To connect on your wordpress database
mysqldump -u username -p databasename > filename.sql // To export the file
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql // To import the file
