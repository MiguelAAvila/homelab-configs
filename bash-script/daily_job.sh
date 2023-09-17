#!/bin/bash

# Load enviromental variables
source .env

for ((i=0; i<${#ips[@]}; i++)); do
    ip="${ips[i]}"
    port="${ports[i]}"
    service="${services[i]}"
    
    if nc -z "$ip" "$port" >/dev/null 2>&1; then
        echo "$ip:$port is up"
        curl -H "X-Tags: tada, partying_face" -H "X-Tags: $service is up" -d "Website $service is up" "$notification_url"
    else
        echo "$ip:$port is down"
        curl -H "X-Tags: rotating_light, $service is down, check status on Portainer" -H "X-Priority: 5" -d "Website $service is down failed" "$notification_url"
    fi
done
