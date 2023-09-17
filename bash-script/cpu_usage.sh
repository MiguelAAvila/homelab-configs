#!/bin/bash

# source enviroment varibles
source ~/homelab/homelab-configs/bash-script/.env

# Get CPU percentage utilization
cpu_usage=$(top -b -n 1 | grep '%Cpu(s):' | awk '{printf "%.0f\n", $2}')

if [ "$cpu_usage" -ge 80 ]; then
   curl \
    -H "Tags: rotating_light, rotating_light, Server CPU Usage High, skull, warning" \
    -H "Title: Laptop CPU Usage: $cpu_usage" \
    -d "High CPU usage on server. Check Services" \
    $cpu_notification_url
fi
