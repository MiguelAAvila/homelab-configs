# Setting up vault warden using docker 

### Create .env file and docker-compose.yml file 
```bash 
touch .env
touch docker-compose.yml 
```

### start with editing the docker-compose.yml file 
```code
services:
  vaultwarden:
    image: vaultwarden/server:latest
    container_name: vaultwarden
    restart: always
    volumes:
      - ./vw-data/:/data/
    ports:
      - 1234:1234
    environment:
      - DOMAIN=$DOMAIN
      - SMTP_HOST=smtp.gmail.com
      - SMTP_FROM=$GMAIL_USERNAME
      - SMTP_FROM_NAME=VaultWarden
      - SMTP_SECURITY=starttls
      - SMTP_PORT=587
      - SMTP_USERNAME=$GMAIL_USERNAME
      - SMTP_PASSWORD=$GMAIL_PASSWORD
      - SMTP_TIMEOUT=30
      - SMTP_AUTH_MECHANISM="Plain"
      - LOGIN_RATELIMIT_MAX_BURST=10
      - LOGIN_RATELIMIT_SECONDS=60
      - SIGNUPS_VERIFY=true
      - SIGNUPS_VERIFY_RESEND_TIME=3600
      - SIGNUPS_VERIFY_RESEND_LIMIT=6
      - EMERGENCY_ACCESS_ALLOWED=true
      - SENDS_ALLOWED=true
      - ADMIN_TOKEN=$ADMIN_PASSWORD
      - WEBSOCKET_ENABLED=true
      - SIGNUPS_ALLOWED=false
```

### Now edit the .env file 
```code
GMAIL_PASSWORD='gmailpasswrodfromoneapp'
GMAIL_USERNAME='gmailemail'
ADMIN_PASSWORD='password generated from vaultwarden, should start with $argon' log into the docker container docker exec -it vwcontainer /vaultwarden hash , then enter a password to generate a hash password
DOMAIN='https://vault.domain.com'
```

### Run the docker container
```bash
docker-compose up -d
``` 
