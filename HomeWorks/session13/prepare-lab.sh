#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session13-lab"
SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_PATH="${LAB_DIR}/sshd_config.backup.$(date +%Y%m%d%H%M%S)"
ADMIN_GROUP="session13_sshadmins"
ADMIN_USER="session13_admin"
GUEST_USER="session13_guest"
CURRENT_USER="$(id -un)"
KEY_PATH="${LAB_DIR}/session13_id_rsa"
PAYLOAD_PATH="${LAB_DIR}/scp-payload.txt"
SUDOERS_DROP="/etc/sudoers.d/${ADMIN_GROUP}"

echo "Session 13 prep starting..."

mkdir -p "${LAB_DIR}"

if [ ! -f "${SSH_CONFIG}" ]; then
  echo "Could not find ${SSH_CONFIG}" >&2
  exit 1
fi

sudo cp "${SSH_CONFIG}" "${BACKUP_PATH}"

if ! grep -q "^${ADMIN_GROUP}:" /etc/group; then
  sudo groupadd "${ADMIN_GROUP}"
fi

if ! grep -q "^${ADMIN_USER}:" /etc/passwd; then
  sudo useradd -m -s /bin/bash "${ADMIN_USER}"
fi

if ! grep -q "^${GUEST_USER}:" /etc/passwd; then
  sudo useradd -m -s /bin/bash "${GUEST_USER}"
fi

sudo usermod -G "${ADMIN_GROUP}" "${ADMIN_USER}"
sudo usermod -aG "${ADMIN_GROUP}" "${CURRENT_USER}"

echo "${ADMIN_USER}:session13321" | sudo chpasswd
echo "${GUEST_USER}:session13321" | sudo chpasswd

printf '%%%s ALL=(ALL:ALL) ALL\n' "${ADMIN_GROUP}" | sudo tee "${SUDOERS_DROP}" >/dev/null
sudo chmod 440 "${SUDOERS_DROP}"

if [ ! -f "${KEY_PATH}" ]; then
  ssh-keygen -t rsa -N "" -f "${KEY_PATH}"
fi

cat > "${PAYLOAD_PATH}" <<'EOF'
Session 13 SCP payload
This file is copied during the SSH hardening lab.
EOF

cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 13 SSH lab prepared.

Current user: ${CURRENT_USER}
SSH config path: ${SSH_CONFIG}
SSH config backup: ${BACKUP_PATH}
Lab admin user: ${ADMIN_USER}
Restricted user: ${GUEST_USER}
SSH admin group: ${ADMIN_GROUP}
Sudoers drop-in: ${SUDOERS_DROP}
Private key path: ${KEY_PATH}
Public key path: ${KEY_PATH}.pub
SCP payload path: ${PAYLOAD_PATH}

Rollback example:
sudo cp ${BACKUP_PATH} ${SSH_CONFIG}
EOF

echo "Session 13 lab prepared at ${LAB_DIR}"
cat "${LAB_DIR}/LAB_NOTES.txt"
echo
echo "Keep your current shell session open while testing SSH changes."
echo "Only disable password SSH access after key-based login works for ${ADMIN_USER}."
