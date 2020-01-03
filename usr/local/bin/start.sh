#!/bin/sh
# Launch the application from here

#https://xpra.org/trac/wiki/Clients/HTML5
xpra start --bind-tcp=0.0.0.0:14500 --start=firefox

sleep infinity
