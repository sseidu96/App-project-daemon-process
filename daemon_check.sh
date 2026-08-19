#!/bin/bash

# Author: Safiatu Seidu
# Date: AUG 19 2026
# Description: Checks a daemon process and restarts it if it is not running.

SERVICE="sshd"

if systemctl is-active --quiet "$SERVICE"
then
    echo "$SERVICE is running."
else
    echo "$SERVICE is not running. Starting it..."
    systemctl start "$SERVICE"

    if systemctl is-active --quiet "$SERVICE"
    then
        echo "$SERVICE started successfully."
    else
        echo "Failed to start $SERVICE."
    fi
fi
