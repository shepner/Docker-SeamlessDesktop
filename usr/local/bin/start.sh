#!/bin/sh
# Launch the application from here

# Xpra stuff:

# https://xpra.org/trac/wiki/Usage/Docker
# https://xpra.org/trac/wiki/Clients/HTML5

su $ENV_USR -c 'xpra start --start-via-proxy=no --bind-tcp=0.0.0.0:14500 --speaker=disabled --microphone=disabled --start=firefox'
sleep 10 #xpra takes a bit to start up

sleep infinity
