Linux Bash Automation Scripts
Project Overview

This repository contains Bash scripts for Linux system administration and server automation.

The project includes scripts for:

Cleaning old log files
Monitoring a Linux daemon
Automating cron job configuration
Scripts
1. clean.sh

Deletes .log files older than 7 days from /var/log.

#!/bin/bash


# Author: Safiatu Seidu
# Date: AUG 19 2026
# Description: Deletes log files older than 7 days.


find /var/log -type f -name "*.log" -mtime +7 -delete


echo "Old logs deleted."

Run:

chmod +x clean.sh
sudo ./clean.sh
2. daemon_check.sh

Checks whether the sshd daemon is running. If it is stopped, the script starts it and verifies that it is running.

#!/bin/bash


# Author: Safiatu Seidu
# Date: AUG 19 2026
# Description: Checks a daemon process and starts it if it is not running.


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

Run:

chmod +x daemon_check.sh
sudo ./daemon_check.sh
3. setup_cron.sh

Automatically creates a cron job that runs daemon_check.sh every 5 minutes.

#!/bin/bash


# Author: Safiatu Seidu
# Date: AUG 19 2026
# Description: Schedules the daemon check script every 5 minutes.


CRON_JOB="*/5 * * * * /root/daemon_check.sh"


(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -


echo "Cron job added successfully."


crontab -l

Run:

chmod +x setup_cron.sh
sudo ./setup_cron.sh

Verify the cron job:

sudo crontab -l

Expected output:

*/5 * * * * /root/daemon_check.sh
Repository Structure
linux-bash-scripts/
├── clean.sh
├── daemon_check.sh
├── setup_cron.sh
└── README.md
Skills Demonstrated
Linux system administration
Bash scripting
Log management
Daemon/service monitoring
systemctl
Cron automation
File management
Server maintenance
Author

Safiatu Seidu

Linux System Administrator | Cloud & Infrastructure Automation

For clean daemon setup, here’s one interview-prep option for Bash automation.
Ad
