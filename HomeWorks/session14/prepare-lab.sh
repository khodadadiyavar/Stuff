#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session14-lab"
HOSTS_FILE="/etc/hosts"
RESOLV_FILE="/etc/resolv.conf"
NSSWITCH_FILE="/etc/nsswitch.conf"

HOSTS_BACKUP="${LAB_DIR}/hosts.backup"
RESOLV_BACKUP="${LAB_DIR}/resolv.conf.backup"
NSSWITCH_BACKUP="${LAB_DIR}/nsswitch.conf.backup"

mkdir -p "${LAB_DIR}"

for file in "${HOSTS_FILE}" "${RESOLV_FILE}" "${NSSWITCH_FILE}"; do
  if [ ! -f "${file}" ]; then
    echo "Missing required file: ${file}" >&2
    exit 1
  fi
done

sudo cp "${HOSTS_FILE}" "${HOSTS_BACKUP}"
sudo cp "${RESOLV_FILE}" "${RESOLV_BACKUP}"
sudo cp "${NSSWITCH_FILE}" "${NSSWITCH_BACKUP}"

cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 14 DNS lab prepared.

Hosts file backup: ${HOSTS_BACKUP}
resolv.conf backup: ${RESOLV_BACKUP}
nsswitch.conf backup: ${NSSWITCH_BACKUP}
EOF
