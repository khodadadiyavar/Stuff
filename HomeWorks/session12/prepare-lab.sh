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

if ! grep -q '^session12_alex:' /etc/group; then
  sudo groupadd session12_alex
fi

if ! grep -q '^session12_alex:' /etc/passwd; then
  sudo useradd -m -g session12_alex -s /bin/bash session12_alex
fi
sudo usermod -g session12_alex -d /home/session12_alex -m -s /bin/bash session12_alex
sudo mkdir -p /home/session12_alex
sudo chown session12_alex:session12_alex /home/session12_alex

if ! grep -q '^session12_service:' /etc/passwd; then
  sudo useradd -M -d /nonexistent -s /usr/sbin/nologin session12_service
fi
sudo usermod -d /nonexistent -s /usr/sbin/nologin session12_service

if ! grep -q '^session12_chris:' /etc/passwd; then
  sudo useradd -m -u 2012 -g session12_cannon -d /home/session12_chris -s /bin/sh -c "Session 12 Analyst" session12_chris
fi
sudo usermod -u 2012 -g session12_cannon -d /home/session12_chris -m -s /bin/sh -c "Session 12 Analyst" session12_chris
sudo mkdir -p /home/session12_chris
sudo chown session12_chris:session12_cannon /home/session12_chris
sudo usermod -aG session12_mercury,session12_sapphire session12_chris

echo 'session12_alex:session12321' | sudo chpasswd
echo 'session12_chris:session12321' | sudo chpasswd

echo "Session 12 prep starting..."
