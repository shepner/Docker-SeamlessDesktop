#!/bin/sh

su docker
xpra start --bind-tcp=0.0.0.0:14500 --start=firefox

