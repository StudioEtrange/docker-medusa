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

Available tag for studioetrange/docker-medusa:__TAG__

	latest, v0.2.9, v0.2.8, v0.2.7, v0.2.6, v0.2.5, v0.2.4, v0.2.3, v0.2.2, v0.2.1, v0.2.0, v0.1.24, v0.1.23, v0.1.22, v0.1.21, v0.1.20, v0.1.19, v0.1.18, v0.1.17, v0.1.16, v0.1.15, v0.1.14, v0.1.13, v0.1.12, v0.1.12rc1, v0.1.11, v0.1.10, v0.1.9, v0.1.8.1, v0.1.8, v0.1.7.1, v0.1.7, v0.1.6, v0.1.5.1, v0.1.5, v0.1.4.1, v0.1.4, v0.1.3, v0.1.2, v0.1.2rc1, v0.1.1, v0.1.1rc1, v0.1.0, v0.1.0rc2

Current latest tag is version __v0.2.9__

## Instruction

### build from github source
	
	git pull https://github.com/StudioEtrange/docker-medusa
	cd docker-medusa
	docker build -t=studioetrange/docker-medusa .

### retrieve image from docker registry

	docker pull studioetrange/docker-medusa

### run medusa 

	docker run -v DATA_DIR:/data -p MEDUSA_HTTP_PORT:8081 -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-medusa:MEDUSA_VERSION

### run medusa daemonized

	docker run -d -v DATA_DIR:/data -p MEDUSA_HTTP_PORT:8081 -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-medusa:MEDUSA_VERSION


### run a shell inside this container (without medusa running)

	docker run -i -t studioetrange/docker-medusa bash

## Access point

### Medusa

	Go to http://localhost:MEDUSA_HTTP_PORT/

### Supervisor

	Go to http://localhost:SUPERVISOR_HTTP_WEB/

## Notes on Github / Docker Hub Repository

* This github repository is linked to an automated build in docker hub registry.

	https://registry.hub.docker.com/u/studioetrange/docker-medusa/

* _update.sh_ is only an admin script which update and add new versions. This script do not auto create missing tag in docker hub webui. It is only for admin/owner purpose.
