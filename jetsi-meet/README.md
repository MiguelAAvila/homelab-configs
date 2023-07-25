
# Set up for Jetsi Meet

- [ ] wget [jesti-verison](https://github.com/jitsi/docker-jitsi-meet/archive/refs/tags/stable-8719.tar.gz) may change when using this command, please check at the website [jetsi-latest-relase](https://github.com/jitsi/docker-jitsi-meet/releases)  

- [ ] ```bash  tar -zxvf stable-8719.tar.gz ```

- [ ] ```bash  cp env.example .env```

- [ ] Edit the file #TODO: add changes made to .env

- [ ] run pass generator ```bash ./gen-passwords.sh ```

- [ ] run this command ```bash mkdir -p ~/.jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}```

- [ ] ```bash docker-compose up -d```

- [ ] create admin that will only create rooms ```bash docker exec -it docker-jitsi-meet-stable-8719_prosody_1 /bin/bash```

- [ ] run this command to create user ```bash prosodyctl --config /config/prosody.cfg.lua register myusername meet.jitsi averystrongpassword```

