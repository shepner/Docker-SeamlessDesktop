###########################################################################################
###########################################################################################
FROM ubuntu:latest

USER root

RUN \
  apt-get -q update \
  && apt-get install -qy \
       apt-utils \
       software-properties-common

###########################################################################################
ARG ARG_USR=docker
ARG ARG_UID=1003
ARG ARG_GID=1100

ENV ENV_USR=$ARG_USR
ENV ENV_UID=$ARG_UID
ENV ENV_GID=$ARG_GID
ENV ENV_HOME=/$ARG_USR

###########################################################################################
###########################################################################################
# App install
ENV TERM=xterm

RUN \
  apt-get -q update \
  && add-apt-repository universe \
  && apt-get install -qy \
       #[xpra download](https://xpra.org/trac/wiki/Download)
       #[instructions](https://winswitch.org/downloads/debian-repository.html)
       xpra \
       firefox


ENV ENV_WORKDIR=/data
VOLUME $ENV_WORKDIR

# this is the port we will use for xpra
EXPOSE 14500

###########################################################################################
###########################################################################################
# installation cleanup
RUN \
  apt-get -q update \
  && apt-get -qy autoclean \
  && apt-get -qy autoremove \
  && rm -rf /var/lib/apt/lists/* \
            /tmp/* \
            /var/tmp/*

###########################################################################################
# startup tasks
#USER $ARG_UID:$ARG_GID
#WORKDIR $ENV_WORKDIR
#CMD $HOME/startup.sh

RUN mkdir -p /usr/local/bin
COPY usr/local/bin/*.sh /usr/local/bin/
RUN \
  chmod 544 /usr/local/bin/configure.sh \
  && chmod 554 /usr/local/bin/start.sh

CMD /bin/sh
