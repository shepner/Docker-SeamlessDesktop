#!/bin/sh
# Launch the application from here

xpra start --bind-tcp=0.0.0.0:14500 --start=firefox
