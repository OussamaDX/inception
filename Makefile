all :
	docker-compose -f ./srcs/docker-compose.yml build

run :
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

re: clean run

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

restart: stop start

rmv:
	sudo rm -rf /home/ooussaad/data/wordpress/*
	sudo rm -rf /home/ooussaad/data/mariadb/*

fclean: clean rmv  