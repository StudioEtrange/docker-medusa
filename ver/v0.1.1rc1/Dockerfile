FROM studioetrange/docker-debian:wheezy
LABEL maintener="StudioEtrange <nomorgan@gmail.com>"


# DEBIAN packages : MEDUSA dependencies install ----------
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
						mediainfo unrar-free openssl libssl-dev python2.7 \
	&& rm -rf /var/lib/apt/lists/*
	

# MEDUSA install -------------
ENV ITEM_VERSION v0.1.1rc1

WORKDIR /opt/medusa

RUN curl -k -SL "https://github.com/pymedusa/Medusa/archive/$ITEM_VERSION.tar.gz" \
	| tar -xzf - -C /opt/medusa --strip-components=1


# SUPERVISOR -------------
COPY supervisord-medusa.conf /etc/supervisor/conf.d/supervisord-medusa.conf

# DOCKER -------------
VOLUME /data

# Supervisord web interface -------
EXPOSE 9999
# medusa http port
EXPOSE 8081

# run command by default
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
