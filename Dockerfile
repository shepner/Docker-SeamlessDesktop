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

ENV TERM=xterm

###########################################################################################
###########################################################################################
# App install
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

COPY usr/local/bin/setup.sh /usr/local/bin/setup.sh
RUN chmod 554 /usr/local/bin/setup.sh

COPY usr/local/bin/setup.sh /usr/local/bin/startup.sh
RUN chmod 554 /usr/local/bin/startup.sh

CMD /bin/sh
