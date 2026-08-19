#!/bin/bash

# Author: Safiatu Seidu
# Date: AUG 19 2026
# Description: Schedules the daemon check script to run every 5 minutes.

CRON_JOB="*/5 * * * * /root/daemon_check.sh"

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully."

crontab -l
