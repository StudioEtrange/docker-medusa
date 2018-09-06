# docker medusa by StudioEtrange

* Run medusa inside a docker container built upon debian
* Based on medusa github source code
* Choice of medusa version
* Use supervisor to manage medusa process
* By default medusa configuration files will be in /data/medusa _(You should map a docker volume to /data)_


## Sample Usage

for running latest stable version of medusa :

	docker run -d -v $(pwd):/data -p 8081:8081 studioetrange/docker-medusa:latest

then go to http://localhost:8081

## Docker tags

Available tag for studioetrange/docker-sickrage:__TAG__

	latest, 507, 506, 505, 504

Current latest tag is version __507__

## Instruction

### build from github source

	git pull https://github.com/StudioEtrange/docker-medusa
	cd docker-medusa
	docker build -t=studioetrange/docker-medusa .

### retrieve image from docker registry

	docker pull studioetrange/docker-medusa

### run medusa 

	docker run -v DATA_DIR:/data -p SICKBEARD_HTTP_PORT:8081 -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-medusa:SICKBEARD_VERSION

### run medusa daemonized

	docker run -d -v DATA_DIR:/data -p SICKBEARD_HTTP_PORT:8081 -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-medusa:SICKBEARD_VERSION


### run a shell inside this container (without medusa running)

	docker run -i -t studioetrange/docker-medusa bash

## Access point

### Sickbeard

	Go to http://localhost:SICKBEARD_HTTP_PORT/

### Supervisor

	Go to http://localhost:SUPERVISOR_HTTP_WEB/

## Notes on Github / Docker Hub Repository

* This github repository is linked to an automated build in docker hub registry.

	https://registry.hub.docker.com/u/studioetrange/docker-sickrage/

* _update.sh_ is only an admin script which update and add new versions. This script do not auto create missing tag in docker hub webui. It is only for admin/owner purpose.
