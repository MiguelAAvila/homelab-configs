#!/bin/bash

ips=("192.168.0.34" "192.168.0.34" "192.168.0.34" "192.168.0.34" "192.168.0.34" "192.168.0.34")
ports=("4080" "9443" "8282" "8080" "8443" "80")
services=("Vault Warden" "Portainer" "Wordpress" "Guacamole" "Coder Server" "ntfy")
notification_url="https://ntfy.avila-miguel.com/WebsiteNotification"

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
