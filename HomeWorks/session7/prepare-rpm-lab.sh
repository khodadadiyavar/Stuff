#!/usr/bin/env bash

set -euo pipefail

if ! command -v rpm >/dev/null 2>&1; then
    echo "This preparation script is for RPM-based systems." >&2
    exit 1
fi

PKG_MGR=""
if command -v dnf >/dev/null 2>&1; then
    PKG_MGR="dnf"
elif command -v yum >/dev/null 2>&1; then
    PKG_MGR="yum"
else
    echo "Could not find dnf or yum on this system." >&2
    exit 1
fi

LAB_DIR="${HOME}/session7-rpm-lab"
mkdir -p "${LAB_DIR}"

echo "Refreshing repository metadata..."
if [ "${PKG_MGR}" = "dnf" ]; then
    sudo dnf -y makecache
    echo "Installing download helper if needed..."
    sudo dnf -y install dnf-plugins-core
else
    sudo yum -y makecache
    echo "Installing download helper if needed..."
    sudo yum -y install yum-utils
fi

rm -f "${LAB_DIR}"/*.rpm

echo "Downloading firefox into ${LAB_DIR}..."
if [ "${PKG_MGR}" = "dnf" ]; then
    dnf download --destdir "${LAB_DIR}" firefox
else
    yumdownloader --destdir "${LAB_DIR}" firefox
fi

RPM_FILE="$(find "${LAB_DIR}" -maxdepth 1 -type f -name '*.rpm' | head -n 1)"

if [ -z "${RPM_FILE}" ]; then
    echo "Package download did not produce a .rpm file." >&2
    exit 1
fi

cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 7 RPM lab prepared.

Package manager: ${PKG_MGR}
Local package file: ${RPM_FILE}

Suggested command for the local package install task:
sudo rpm -ivh "${RPM_FILE}"

Suggested command for listing repositories:
${PKG_MGR} repolist all

Suggested command for finding the provider of tcpdump:
${PKG_MGR} provides '*/tcpdump'
EOF

echo
echo "Lab prepared successfully."
cat "${LAB_DIR}/LAB_NOTES.txt"
