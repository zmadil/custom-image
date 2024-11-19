#!/bin/bash

BOOT_PARTITION="/boot/firmware"
COMPOSE_FILE="docker-compose.yml"
DEST_DIR="/opt/docker-compose"

if [ -f "${BOOT_PARTITION}/${COMPOSE_FILE}" ]; then
  mkdir -p "${DEST_DIR}"
  cp "${BOOT_PARTITION}/${COMPOSE_FILE}" "${DEST_DIR}/"
fi

cd "${DEST_DIR}"
docker compose up -d
