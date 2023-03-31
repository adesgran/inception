all: start 

start:
	sudo docker-compose -f srcs/docker-compose.yml up

build:
	sudo docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down


