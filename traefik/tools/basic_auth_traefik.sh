#!/bin/bash

SUDO=''
if (( $EUID != 0 )); then SUDO='sudo'; fi

echo "Auth generator for traefik"
read -p "User: "  USER
read -p "Password: "  PW

# Checks if htpasswd is available or install it otherwise
which htpasswd >/dev/null || ($SUDO apt-get update && $SUDO apt-get install apache2-utils)

# Generate strings
string=$(htpasswd -nbB $USER $PW)
echo $string
