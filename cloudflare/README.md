# Setting up cloudflare using docker 

### Create a new tunnel under cloudflare website

- Once you login into cloudflare, click ```Zero Trust``` tab, then under ```Access``` click ```Tunnels```.
- Click ```+ Create a tunnel``` and follow the intructions there.
- Once configure, click ```Docker``` tab, it should give you the token for the tunnel to run with docker. Save that for later. 


### Create .env file and docker-compose.yml file 
```bash 
touch .env
touch docker-compose.yml 
```

### start with editing the docker-compose.yml file 
```code
version: "3.91"

services:
  cloudflaretunnel:
    container_name: cloudflareturnel
    image: cloudflare/cloudflared:latest
    restart: always
    env_file:
      - ./.env
    command: tunnel --no-autoupdate run --token $TUNNEL_TOKEN
    network_mode: "host"

```

### Now edit the .env file 
```code
TUNNEL_TOKEN='CloudFlare Token here'
```
- TOKEN: is the token from cloudflare website that was copy, it something like this: ```docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token TOKENHERE```

### Run the docker container
```bash
docker-compose up -d
``` 
