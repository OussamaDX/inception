FROM debian:bullseye

RUN apt update && apt install -y 

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh	script.sh
RUN chmod 755 script.sh

CMD [ "sh" , "script.sh" ]