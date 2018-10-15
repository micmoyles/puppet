#!/bin/bash

# This file will configure the apt repos to install puppet 3.8 on a node
# this file should be placed in /usr/local/bin/

if [[ `id -u` -ne 0 ]]
then
	echo "Must be run as root"
fi

