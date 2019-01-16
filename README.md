# docker medusa by StudioEtrange

* Run medusa inside a docker container built upon debian
* Based on medusa github repository
* Choice of medusa version
* Use supervisor to manage medusa process
* Can choose a specific unix user to run medusa inside docker
* By default medusa configuration files will be in a folder named 'medusa' which will be contained in a docker volume /data
* Optional volume 'tv' used as tv root folder

## Quick Usage

for running latest stable version of medusa :
	
	mkdir -p data
	docker --name medusa run -d -v $(pwd)/data:/data -p 8081:8081 studioetrange/docker-medusa

then go to http://localhost:8081

## Docker tags

Available tag for studioetrange/docker-medusa:__TAG__

	latest, v0.2.14, v0.2.13, v0.2.12, v0.2.11, v0.2.10, v0.2.9, v0.2.8, v0.2.7, v0.2.6, v0.2.5, v0.2.4, v0.2.3, v0.2.2, v0.2.1, v0.2.0, v0.1.24, v0.1.23, v0.1.22, v0.1.21, v0.1.20, v0.1.19, v0.1.18, v0.1.17, v0.1.16, v0.1.15, v0.1.14, v0.1.13, v0.1.12, v0.1.12rc1, v0.1.11, v0.1.10, v0.1.9, v0.1.8.1, v0.1.8, v0.1.7.1, v0.1.7, v0.1.6, v0.1.5.1, v0.1.5, v0.1.4.1, v0.1.4, v0.1.3, v0.1.2, v0.1.2rc1, v0.1.1, v0.1.1rc1, v0.1.0, v0.1.0rc2

Current latest tag is version __v0.2.14__

## Instruction

### Build from github source

	git pull https://github.com/StudioEtrange/docker-medusa
	cd docker-medusa
	docker build -t=studioetrange/docker-medusa .

### Retrieve image from docker registry

	docker pull studioetrange/docker-medusa

### Standard usage

	mkdir -p tv
	mkdir -p data
	mkdir -p download
	docker run --name medusa -d -v $(pwd)/data:/data -v $(pwd)/tv:/tv -v $(pwd)/download:/download -p 8081:8081 -e SERVICE_USER=$(id -u):$(id -g) -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro studioetrange/docker-medusa

### Full run parameters

	docker run --name medusa -d -v <data path>:/data -v <tv show path>:/tv -v <download show path>:/download -p <medusa http port>:8081 -e SERVICE_USER=<uid[:gid]>  -p <supervisor manager http port>:9999 -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro studioetrange/docker-medusa:<version>

### Volumes

Inside container
`/data/medusa` will contain medusa configuration and files
`/tv` is the root folder of your tv shows
`/download` is the root folder of your downloads files from other software

If any path of theses volumes do not exist on the host while your are mounting them inside container, docker will create it automaticly with root user. You should use mkdir before launching docker to control ownership.

### Access to a running instance

supervisorctl access

	docker exec -it medusa bash -c ". activate medusa && supervisorctl"
	
bash access

	docker exec -it medusa bash -c ". activate medusa"
 
### Test a shell inside a new container without medusa running

	docker run -it --rm studioetrange/docker-medusa bash
	
### Stop and destroy all previously launched services

	docker stop medusa && docker rm medusa

## Access point

### medusa

	Go to http://localhost:MEDUSA_HTTP_PORT/

### Supervisor process manager

	Go to http://localhost:SUPERVISOR_HTTP_WEB/

## Notes on Github / Docker Hub Repository

* This github repository is linked to an automated build in docker hub registry.

	https://registry.hub.docker.com/u/studioetrange/docker-medusa/

* _update.sh_ is only an admin script for this project which update and add new versions. This script do not auto create missing tag in docker hub webui. It is only for this project admin/owner purpose.
