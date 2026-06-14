#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session11-lab"

rm -rf "${LAB_DIR}"
mkdir -p "${LAB_DIR}"/{results,man1,etc/systemd/system,etc/network,opt/test/test123/caleston,Africa/Egypt/Cairo,Asia/India/Mumbai}

touch "${LAB_DIR}/vi-kodekloud.txt"

cat > "${LAB_DIR}/notes.txt" <<'EOF'
This is the first note.
This is the second note.
This is the third note.
EOF

cat > "${LAB_DIR}/testfile.txt" <<'EOF'
Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
Line 8
Line 9
Line 10
EOF

cat > "${LAB_DIR}/sample.txt" <<'EOF'
This is the first line.
Followed by the second line.
And then the third line.
The fourth line has CAPITAL LETTERS
The fifth line does not want to be printed
Hello There!
Nice to see you here!
EOF

cat > "${LAB_DIR}/etc/systemd/system/dummy.service" <<'EOF'
[Unit]
Description=Dummy Service
EOF

cat > "${LAB_DIR}/etc/network/address.conf" <<'EOF'
DEVICE=eth0
IPADDR=172.16.238.197
NETMASK=255.255.255.0
EOF

cat > "${LAB_DIR}/opt/test/test123/caleston/caleston-code" <<'EOF'
This file was saved in the wrong place.
EOF

cat > "${LAB_DIR}/Asia/India/Mumbai/City.txt" <<'EOF'
Mumbai
EOF

cat > "${LAB_DIR}/Africa/Egypt/Cairo/City.txt" <<'EOF'
Cairo
EOF

cat > "${LAB_DIR}/my_python_test.py" <<'EOF'
print("Starting test")
raise Exception("simulated python error")
EOF

cat > "${LAB_DIR}/man1/tail.1" <<'EOF'
TAIL(1)
NAME
tail - output the last part of files
EOF

gzip -f "${LAB_DIR}/man1/tail.1"

cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 11 lab prepared.

Lab directory: ${LAB_DIR}

Use this directory for all tasks.
If locate does not find the new files immediately, run:
sudo updatedb
EOF

echo "Session 11 lab prepared at ${LAB_DIR}"
cat "${LAB_DIR}/LAB_NOTES.txt"
