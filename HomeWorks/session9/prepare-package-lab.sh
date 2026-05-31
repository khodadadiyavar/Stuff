#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session9-package-lab"
mkdir -p "${LAB_DIR}"

source /etc/os-release

if command -v dpkg >/dev/null 2>&1 && command -v apt-get >/dev/null 2>&1; then
    FAMILY="debian"
elif command -v rpm >/dev/null 2>&1; then
    FAMILY="rpm"
else
    echo "Unsupported package-management family on this system." >&2
    exit 1
fi

if [ "${FAMILY}" = "debian" ]; then
    echo "Detected Debian-family system."
    sudo apt-get update

    FIREFOX_PKG=""
    for candidate in firefox firefox-esr; do
        if apt-cache show "${candidate}" >/dev/null 2>&1; then
            FIREFOX_PKG="${candidate}"
            break
        fi
    done

    if [ -z "${FIREFOX_PKG}" ]; then
        echo "Could not find a Firefox package in the configured repositories." >&2
        exit 1
    fi

    rm -f "${LAB_DIR}"/*.deb
    (
        cd "${LAB_DIR}"
        apt download "${FIREFOX_PKG}"
    )

    PKG_FILE="$(find "${LAB_DIR}" -maxdepth 1 -type f -name '*.deb' | head -n 1)"

    cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 9 package-management lab prepared.

Detected family: Debian/Ubuntu
Firefox package name: ${FIREFOX_PKG}
Local package file: ${PKG_FILE}

Low-level install test:
sudo dpkg -i "${PKG_FILE}"

Higher-level install:
sudo apt install -y ${FIREFOX_PKG}
EOF
else
    echo "Detected RPM-family system."

    if command -v dnf >/dev/null 2>&1; then
        PKG_MGR="dnf"
        sudo dnf -y makecache
        sudo dnf -y install dnf-plugins-core
        dnf download --destdir "${LAB_DIR}" firefox
    else
        PKG_MGR="yum"
        sudo yum -y makecache
        sudo yum -y install yum-utils
        yumdownloader --destdir "${LAB_DIR}" firefox
    fi

    PKG_FILE="$(find "${LAB_DIR}" -maxdepth 1 -type f -name '*.rpm' | head -n 1)"

    cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 9 package-management lab prepared.

Detected family: RPM
Higher-level package manager: ${PKG_MGR}
Local package file: ${PKG_FILE}

Low-level install test:
sudo rpm -ivh "${PKG_FILE}"

Higher-level install:
sudo ${PKG_MGR} install -y firefox
EOF
fi

echo
echo "Lab prepared successfully."
cat "${LAB_DIR}/LAB_NOTES.txt"
