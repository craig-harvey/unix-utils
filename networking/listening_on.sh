#!/bin/bash

#######################################################################################
# Simple script to show which app is listening on a particular port. 
#
# Returns the process that is listening on the specified port
# Currently only tested on ubuntu 14.04
#
# Usage: listening_on <port_number>
#

PORT_NUM=$(netstat -tulpn 2>&1 | grep $1 | grep tcp | awk 'match($7, "/") {print substr($7, 1, RSTART-1)}')

ps -ef | grep $PORT_NUM | grep -v grep
