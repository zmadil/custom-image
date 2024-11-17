#!/bin/bash
# Install Docker
curl -sSL https://get.docker.com | sh

# Add user 'pi' to Docker group
usermod -aG docker $USER
