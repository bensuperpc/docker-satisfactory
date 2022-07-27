#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2022                                            //
#//  Created: 14, April, 2022                                //
#//  Modified: 27, July, 2022                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source:                                                 //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

DOCKER := docker

PROFILE := satisfactory backup
PROFILE_CMD := $(addprefix --profile ,$(PROFILE))

COMPOSE_FILE := docker-compose.yml

AUTHOR := wolveix

IMAGE_NAME := satisfactory-server

IMAGE_AUTHOR := $(addprefix $(AUTHOR)/, $(IMAGE_NAME))

IMAGE_FULL_NAME := $(addsuffix :latest, $(IMAGE_AUTHOR))

.PHONY: build all
all: start

.PHONY: start
start:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) up -d

.PHONY: start-at
start-at:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) up

.PHONY: stop
stop: down

.PHONY: down
down:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) down

.PHONY: restart
restart: stop start

.PHONY: logs
logs:
	docker-compose -f $(COMPOSE_FILE) logs

.PHONY: state
state:
	docker-compose -f $(COMPOSE_FILE) ps
	docker-compose -f $(COMPOSE_FILE) top

.PHONY: update
update:
	git pull --recurse-submodules --all --progress
	echo $(IMAGE_FULL_NAME) | xargs -n1 docker pull

.PHONY: clean
clean:
	docker-compose down --rmi all

.PHONY: purge
purge:
	docker-compose down -v --rmi all
