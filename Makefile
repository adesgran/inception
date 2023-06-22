all: build

up:
	docker-compose -f srcs/docker-compose.yml up

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/nginx
	sudo sed -i "s/localhost/adesgran.42.fr/g" /etc/hosts
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	sudo rm -rf ~/data || true
	sudo docker system prune -fa || true
	sudo docker volume rm $(sudo docker volume ls -q) || true
	sudo docker network rm $(sudo docker network ls -q) || true

re: clean build
