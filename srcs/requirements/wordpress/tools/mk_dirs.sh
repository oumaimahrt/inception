#!/bin/bash

# check if the data folder in the user folder exists ,if not, create it
if [ ! -d "/home/${USER}/data" ]; then
        mkdir ~/data
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
fi