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
# general settings
ENV TERM=xterm
  
###########################################################################################
# user setup
ENV \
  PUSR=docker \
  ARG_PUID=1003 \
  ARG_PGID=1100
ENV HOME="/$PUSR"

# set the default values we will use
ARG PUID=$ARG_PUID
ARG PGID=$ARG_PGID

# create the group, user, and home dir
RUN \
  groupadd -r -g $PGID $PUSR \
  && useradd -r -b / -d $HOME -m -u $PUID -g $PGID -s /bin/bash $PUSR

###########################################################################################
# setup the working directory
ENV DATA_DIR="/data"

RUN \
  mkdir -p $DATA_DIR \
  && chown -R $PUID:$PGID $DATA_DIR

VOLUME $DATA_DIR

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
#USER $PUSR:$PGID
#WORKDIR $DATA_DIR
#CMD $HOME/startup.sh

CMD /bin/sh
