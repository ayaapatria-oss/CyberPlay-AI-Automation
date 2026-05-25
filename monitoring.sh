#!/bin/bash

LOG="cyberplay_monitor.log"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
MEMORY=$(free -m | awk 'NR==2{printf "%sMB/%sMB", $3,$2}')

ping -c 1 google.com > /dev/null

if [ $? -eq 0 ]; then
    STATUS="Network Normal"
else
    STATUS="Network Error"
fi

echo "$(date) | CPU: $CPU% | Memory: $MEMORY | Status: $STATUS" >> $LOG
