all: start 

start:
	sudo docker-compose -f srcs/docker-compose.yml up

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	rm -rf ~/data

prune: clean
	docker system prune -f

re: prune build
