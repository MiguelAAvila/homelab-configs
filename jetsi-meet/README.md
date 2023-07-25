
# Set up for Jetsi Meet

#### Get Jetsi Meet Release package, DO NOT CLONE 
```bash
 wget [jesti-verison](https://github.com/jitsi/docker-jitsi-meet/archive/refs/tags/stable-8719.tar.gz)   
```
may change when using this command, please check at the website [jetsi-latest-relase](https://github.com/jitsi/docker-jitsi-meet/releases)

#### Extract the Release package 

```bash
tar -zxvf stable-8719.tar.gz
```

#### cd into the directory 
```bash
cd docker-jitsi-meet-stable-1111
````

#### Copy the env.example file as a .env
```bash  cp env.example .env```

#### Edit the .env file with correct settings 

- Edit the file #TODO: add changes made to .env

#### Generate strong password for .env with ./gen-password.sh
```bash
./gen-passwords.sh
```
#### Create required CONFIG directories
- run this command 
```bash 
mkdir -p ~/.jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
```

#### Brind the docker container up
```bash 
docker-compose up -d
```

#### Create admin user that will be incharge of creating rooms 
- log into the docker container
```bash 
docker exec -it docker-jitsi-meet-stable-8719_prosody_1 /bin/bash
```

- run this command to create user
```bash
prosodyctl --config /config/prosody.cfg.lua register myusername meet.jitsi averystrongpassword
```

