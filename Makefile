all: start 

start:
	sudo docker-compose -f srcs/docker-compose.yml up

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --build

down:
	sudo docker-compose -f srcs/docker-compose.yml down

clean:
	rm -rf ~/data

prune: clean
	sudo docker system prune -f

re: prune build
