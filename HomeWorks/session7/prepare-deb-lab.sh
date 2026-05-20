#!/usr/bin/env bash

set -euo pipefail

if ! command -v dpkg >/dev/null 2>&1 || ! command -v apt-get >/dev/null 2>&1; then
    echo "This preparation script is for Debian-based systems." >&2
    exit 1
fi

LAB_DIR="${HOME}/session7-deb-lab"
mkdir -p "${LAB_DIR}"

echo "Refreshing package metadata..."
sudo apt-get update

FIREFOX_PKG=""
for candidate in firefox firefox-esr; do
    if apt-cache show "${candidate}" >/dev/null 2>&1; then
        FIREFOX_PKG="${candidate}"
        break
    fi
done

if [ -z "${FIREFOX_PKG}" ]; then
    echo "Could not find a Firefox package in the configured APT repositories." >&2
    exit 1
fi

rm -f "${LAB_DIR}"/*.deb

echo "Downloading ${FIREFOX_PKG} into ${LAB_DIR}..."
(
    cd "${LAB_DIR}"
    apt download "${FIREFOX_PKG}"
)

DEB_FILE="$(find "${LAB_DIR}" -maxdepth 1 -type f -name '*.deb' | head -n 1)"

if [ -z "${DEB_FILE}" ]; then
    echo "Package download did not produce a .deb file." >&2
    exit 1
fi

cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 7 Debian lab prepared.

Firefox package name: ${FIREFOX_PKG}
Local package file: ${DEB_FILE}

Suggested command for the local package install task:
sudo dpkg -i "${DEB_FILE}"

Suggested command for searching Chromium:
apt search chromium
EOF

echo
echo "Lab prepared successfully."
cat "${LAB_DIR}/LAB_NOTES.txt"
