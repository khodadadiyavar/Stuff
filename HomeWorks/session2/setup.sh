#!/bin/bash

set -e

echo "🚀 Setting up Session 2 lab environment..."

append_line_if_missing() {
    local file="$1"
    local line="$2"

    sudo touch "$file"

    if ! sudo grep -Fqx "$line" "$file"; then
        printf '%s\n' "$line" | sudo tee -a "$file" >/dev/null
    fi
}

# Create user bob if not exists
if ! id "bob" &>/dev/null; then
    sudo useradd -m -s /bin/bash bob
    echo "bob:caleston123" | sudo chpasswd
    echo "✅ User 'bob' created"
else
    echo "ℹ️ User 'bob' already exists"
fi

# Ensure predictable TERM variable
append_line_if_missing /home/bob/.profile 'export TERM=xterm-256color'

# Create fake directory NOT in PATH
sudo mkdir -p /opt/caleston-code

# Ensure standard PATH
append_line_if_missing /home/bob/.profile 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'

# Fix ownership
sudo chown bob:bob /home/bob/.profile

echo "✅ Environment setup complete."

if [ "$(id -un)" = "bob" ]; then
    exit 0
fi

echo "🔄 Switching to user 'bob'..."

if [ "$(id -u)" -eq 0 ]; then
    exec su - bob
else
    exec sudo -iu bob
fi
