# docker medusa by StudioEtrange

* Run medusa inside a docker container built upon debian
* Based on medusa github source code
* Choice of medusa version
* Use supervisor to manage medusa process
* Can choose a specific unix user to run medusa inside docker
* By default medusa configuration files will be in /data/medusa _(You should map a docker volume to /data)_


## Quick Usage

for running latest stable version of medusa :

	docker run -d -v $(pwd):/data -v $(pwd)/tv:/tv -p 8081:8081 studioetrange/docker-medusa

then go to http://localhost:8081

## Docker tags

Available tag for studioetrange/docker-medusa:__TAG__

	latest, v0.2.12, v0.2.11, v0.2.10, v0.2.9, v0.2.8, v0.2.7, v0.2.6, v0.2.5, v0.2.4, v0.2.3, v0.2.2, v0.2.1, v0.2.0, v0.1.24, v0.1.23, v0.1.22, v0.1.21, v0.1.20, v0.1.19, v0.1.18, v0.1.17, v0.1.16, v0.1.15, v0.1.14, v0.1.13, v0.1.12, v0.1.12rc1, v0.1.11, v0.1.10, v0.1.9, v0.1.8.1, v0.1.8, v0.1.7.1, v0.1.7, v0.1.6, v0.1.5.1, v0.1.5, v0.1.4.1, v0.1.4, v0.1.3, v0.1.2, v0.1.2rc1, v0.1.1, v0.1.1rc1, v0.1.0, v0.1.0rc2

Current latest tag is version __v0.2.12__

## Instruction

### build from github source

	git pull https://github.com/StudioEtrange/docker-medusa
	cd docker-medusa
	docker build -t=studioetrange/docker-medusa .

### retrieve image from docker registry

	docker pull studioetrange/docker-medusa

### standard usage

	docker run -d -v $(pwd):/data -v $(pwd)/tv:/tv -p 8081:8081 -e SERVICE_USER=$(id -u):$(id -g) -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro studioetrange/docker-medusa

### full run parameters

	docker run --name medusa -d -v <local path>:/data -v <tv show path>:/tv -p <medusa http port>:8081 -e SERVICE_USER=<uid[:gid]>  -p <supervisor manager http port>:9999 studioetrange/docker-medusa:<version>

	`/data/medusa` will contain medusa configuration and database
	`/tv` is the root folder of your tv shows

### access supervisor control inside a running instance

	docker exec -it medusa bash -c ". activate medusa && supervisorctl"

### test a shell inside a new container without medusa running

	docker run -it studioetrange/docker-medusa bash

## Access point

### Medusa

	Go to http://localhost:MEDUSA_HTTP_PORT/

### Supervisor process manager

	Go to http://localhost:SUPERVISOR_HTTP_WEB/

## Notes on Github / Docker Hub Repository

* This github repository is linked to an automated build in docker hub registry.

	https://registry.hub.docker.com/u/studioetrange/docker-medusa/

* _update.sh_ is only an admin script which update and add new versions. This script do not auto create missing tag in docker hub webui. It is only for admin/owner purpose.
