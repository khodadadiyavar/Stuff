#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session9-archive-lab"
rm -rf "${LAB_DIR}"
mkdir -p "${LAB_DIR}"/{reports,logs,images,exports}

cat > "${LAB_DIR}/reports/summary-q1.txt" <<'EOF'
Quarterly support summary
System incidents stabilized after patching.
Compression and archive handling need further practice.
EOF

cat > "${LAB_DIR}/reports/summary-q2.txt" <<'EOF'
Quarterly support summary
Package deployments improved.
Storage cleanup and support-bundle creation remain recurring tasks.
EOF

yes "application log line for compression practice" | head -n 12000 > "${LAB_DIR}/logs/app.log"
yes "audit event entry" | head -n 18000 > "${LAB_DIR}/logs/audit.log"
yes "export row with repeated values for archive testing" | head -n 22000 > "${LAB_DIR}/exports/data.csv"

dd if=/dev/zero of="${LAB_DIR}/images/disk-zero.img" bs=1024 count=2048 status=none
dd if=/dev/urandom of="${LAB_DIR}/images/random.bin" bs=1024 count=768 status=none

cat > "${LAB_DIR}/README.txt" <<EOF
Session 9 archive and compression lab prepared.

Lab directory: ${LAB_DIR}

Suggested targets:
- reports/
- logs/
- images/
- exports/
EOF

echo "Archive lab prepared at ${LAB_DIR}"
du -sh "${LAB_DIR}"
