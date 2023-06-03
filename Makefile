.PHONY: deploy status remove clean prepare logs_* sh_*pinpoint-we

deploy:
	docker-compose up -d --remove-orphans

status:
	docker-compose ps

remove:
	docker-compose rm -vsf

clean: remove
	docker network rm pinpoint-docker_pinpoint

prepare:
#       mkdir -p /srv/docker/volumes/pinpoint-collector/redis/data

logs_pinpoint-collector:
	docker container logs -f  `docker container ls | grep pinpoint-collector | cut -d " " -f 1`

sh_pinpoint-collector:
	docker container exec -it `docker container ls | grep pinpoint-collector | cut -d " " -f 1` bash

logs_pinpoint-quickstart:
	docker container logs -f  `docker container ls | grep pinpoint-quickstart | cut -d " " -f 1`

sh_pinpoint-quickstart:
	docker container exec -it `docker container ls | grep pinpoint-quickstart | cut -d " " -f 1` bash

logs_zoo1:
	docker container logs -f  `docker container ls | grep zoo1 | cut -d " " -f 1`

sh_zoo1:
	docker container exec -it `docker container ls | grep zoo1 | cut -d " " -f 1` sh
