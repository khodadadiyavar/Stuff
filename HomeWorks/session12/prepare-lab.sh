#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session12-lab"

mkdir -p "${LAB_DIR}"

GROUPS=(
  session12_mercury
  session12_sapphire
  session12_cannon
)

for group in "${GROUPS[@]}"; do
  if ! grep -q "^${group}:" /etc/group; then
    sudo groupadd "${group}"
  fi
done

if ! grep -q '^session12_alex:' /etc/passwd; then
  sudo useradd -m -s /bin/bash session12_alex
fi

if ! grep -q '^session12_service:' /etc/passwd; then
  sudo useradd -M -s /usr/sbin/nologin session12_service
fi

if ! grep -q '^session12_chris:' /etc/passwd; then
  sudo useradd -u 2012 -g session12_cannon -d /home/session12_chris -s /bin/sh -c "Session 12 Analyst" session12_chris
fi

echo "Session 12 prep starting..."
