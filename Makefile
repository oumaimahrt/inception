name = inception
all:
		@printf "Launch configuration ${name}...\n"
	@bash $$(pwd)/srcs/requirements/wordpress/tools/mk_dirs.sh
		@docker-compose -f $$(pwd)/srcs/docker-compose.yml up -d --build

build:
		@printf "Building configuration ${name}...\n"
	@bash $$(pwd)/srcs/requirements/wordpress/tools/mk_dirs.sh
		@docker-compose -f $$(pwd)/srcs/docker-compose.yml build

down:
		@printf "Stopping configuration ${name}...\n"
		@docker-compose -f $$(pwd)/srcs/docker-compose.yml down

re: down
		@printf "Rebuild configuration ${name}...\n"
		@docker-compose -f $$(pwd)/srcs/docker-compose.yml up -d --build

clean: down
		@printf "Cleaning configuration ${name}...\n"
		@docker system prune -a
		@sudo rm -rf ~/data/wordpress/*
		@sudo rm -rf ~/data/mariadb/*

ctop-up:
		@cd $$(pwd)/srcs/requirements/bonus/ctop && docker build -t ctop . && docker run --rm -ti --name=ctop -v /var/run/docker.sock:/var/run/docker.sock ctop

ctop-down:
		@docker kill ctop

fclean:
		@printf "Total clean of all configurations docker\n"
		@docker stop $$(docker ps -qa)
		@docker network prune --force
		@docker rm $$(docker ps -qa)
		@docker rmi -f $$(docker images -q)
		@docker system prune --all --force --volumes
		@docker volume prune --force
		@sudo rm -rf ~/data/wordpress/*
		@sudo rm -rf ~/data/mariadb/*