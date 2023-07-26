# Config for cloudflare deployment and other services

## Services currenly using: 
- Cloudflare Tunnel
- VaultWarden
- Jetsi Meet

## Todos after creating server: 

#### Turn off laptop screen after x mins
```code
sudo nano /etc/systemd/system/enable-console-blanking.service
```

```code
[Unit]
Description=Enable virtual console blanking

[Service]
Type=oneshot
Environment=TERM=linux
StandardOutput=tty
TTYPath=/dev/console
ExecStart=/usr/bin/setterm -blank 1

[Install]
WantedBy=multi-user.target
```

```bash
sudo chmod 664 /etc/systemd/system/enable-console-blanking.service
sudo systemctl enable enable-console-blanking.service
```
##### installing docker with docker-compose
[Docker Documentation](https://docs.docker.com/engine/install/ubuntu/#install-from-a-package) 
