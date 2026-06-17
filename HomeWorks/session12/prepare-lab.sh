#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session12-lab"

mkdir -p "${LAB_DIR}"

echo "Session 12 prep starting..."

LAB_GROUPS=(
  session12_mercury
  session12_sapphire
)

for group in "${LAB_GROUPS[@]}"; do
  if ! grep -q "^${group}:" /etc/group; then
    sudo groupadd "${group}"
  fi
done

if grep -q '^session12_john:' /etc/passwd; then
  sudo userdel -r session12_john 2>/dev/null || sudo userdel session12_john
fi

if grep -q '^session12_sarah:' /etc/passwd; then
  sudo userdel -r session12_sarah 2>/dev/null || sudo userdel session12_sarah
fi

if grep -q '^session12_sarah:' /etc/group; then
  sudo groupdel session12_sarah
fi

if grep -q '^session12_john:' /etc/group; then
  sudo groupdel session12_john
fi

if grep -q '^session12_cannon:' /etc/group; then
  sudo groupmod -g 2012 session12_cannon
else
  sudo groupadd -g 2012 session12_cannon
fi

if ! grep -q '^session12_alex:' /etc/group; then
  sudo groupadd session12_alex
fi

if ! grep -q '^session12_alex:' /etc/passwd; then
  sudo useradd -m -g session12_alex -s /bin/bash session12_alex
fi
sudo usermod -g session12_alex -d /home/session12_alex -m -s /bin/bash session12_alex
sudo mkdir -p /home/session12_alex
sudo chown session12_alex:session12_alex /home/session12_alex

if grep -q '^session12_service:' /etc/passwd; then
  if [ "$(id -u session12_service)" -ge 1000 ]; then
    sudo userdel session12_service
  fi
fi

if ! grep -q '^session12_service:' /etc/passwd; then
  sudo useradd -r -M -d /nonexistent -s /usr/sbin/nologin session12_service
fi
sudo usermod -d /nonexistent -s /usr/sbin/nologin session12_service

if ! grep -q '^session12_chris:' /etc/passwd; then
  sudo useradd -m -u 2012 -g session12_cannon -d /home/session12_chris -s /bin/sh -c "Session 12 Analyst" session12_chris
fi
sudo usermod -u 2012 -g session12_cannon -d /home/session12_chris -m -s /bin/sh -c "Session 12 Analyst" session12_chris
sudo mkdir -p /home/session12_chris
sudo chown session12_chris:session12_cannon /home/session12_chris
sudo usermod -G session12_mercury,session12_sapphire session12_chris

echo 'session12_alex:session12321' | sudo chpasswd
echo 'session12_chris:session12321' | sudo chpasswd

mkdir -p "${LAB_DIR}"/projects/{sports,shared,secure}
touch "${LAB_DIR}/projects/sports/soccer"
touch "${LAB_DIR}/projects/sports/tennis"
touch "${LAB_DIR}/projects/shared/report.txt"

chmod 777 "${LAB_DIR}/projects/sports/soccer"
chmod 750 "${LAB_DIR}/projects/sports"
sudo chown session12_alex:session12_mercury "${LAB_DIR}/projects/sports/soccer"
sudo chown -R session12_alex:session12_mercury "${LAB_DIR}/projects/shared"

ln -sf "${LAB_DIR}/projects/shared/report.txt" "${LAB_DIR}/report-link"
rm -f "${LAB_DIR}/lab-pipe"
mkfifo "${LAB_DIR}/lab-pipe"

cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 12 lab prepared.

Lab directory: ${LAB_DIR}
Users:
- session12_alex
- session12_chris
- session12_service

Groups:
- session12_mercury
- session12_sapphire
- session12_cannon

Password to use for created standard users:
session12321
EOF

echo "Session 12 lab prepared at ${LAB_DIR}"
cat "${LAB_DIR}/LAB_NOTES.txt"
