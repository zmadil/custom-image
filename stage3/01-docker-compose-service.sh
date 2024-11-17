#!/bin/bash

# Create a systemd service to start Docker Compose on boot
cat > /etc/systemd/system/docker-compose-home-assistant.service <<EOF
[Unit]
Description=Home Assistant Docker Compose
After=docker.service
Requires=docker.service

[Service]
WorkingDirectory=/opt
ExecStart=/usr/local/bin/docker-compose -f /opt/docker-compose.yml up -d
ExecStop=/usr/local/bin/docker-compose -f /opt/docker-compose.yml down
Restart=always
User=$USER

[Install]
WantedBy=multi-user.target
EOF

# Enable the systemd service
sudo systemctl enable docker-compose.service
