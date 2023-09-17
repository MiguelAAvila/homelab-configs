#!/bin/bash

# Load enviromental variables
source ~/homelab/homelab-configs/bash-script/.env

for ((i=0; i<${#ips[@]}; i++)); do
    ip="${ips[i]}"
    port="${ports[i]}"
    service="${services[i]}"
    
    if nc -z "$ip" "$port" >/dev/null 2>&1; then
        echo "$ip:$port is up"
        curl -H "X-Tags: tada, partying_face" -H "X-Tags: $service is up" -d "Website $service is up" "$website_notification_url"
    else
        echo "$ip:$port is down"
        curl -H "X-Tags: rotating_light, skull, $service is down, check status on Portainer" -d "Website $service is down failed" "$website_notification_url"
    fi
done
