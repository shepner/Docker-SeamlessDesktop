#!/bin/sh
# Dynamic configuration items go here


# create the user's group
groupadd -r -g $ENV_GID $ENV_USR
# create the user account and home dir
useradd -r -b / -d $ENV_HOME -m -u $ENV_UID -g $ENV_GID -s /bin/bash $PUSR

# setup the working directory
mkdir -p $ENV_WORKDIR
chown -R $ENV_UID:$ENV_GID $ENV_WORKDIR

# launch the application
#su docker
#/usr/local/bin/startup.sh
