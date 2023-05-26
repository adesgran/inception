all: start 

start:
	sudo docker-compose -f srcs/docker-compose.yml up

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/nginx
	sudo sed -i "s/localhost/adesgran.42.fr/g" /etc/hosts
	sudo docker-compose -f srcs/docker-compose.yml up --build

down:
	sudo docker-compose -f srcs/docker-compose.yml down

clean: down
	sudo rm -rf ~/data

prune: clean
	sudo docker system prune -f

re: prune build
