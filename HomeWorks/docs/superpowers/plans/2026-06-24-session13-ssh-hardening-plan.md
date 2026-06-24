# Session 13 SSH Hardening Lab Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a real-system Session 13 lab with one scenario-based homework file, one answer key, and one prep script covering SSH basics, SSH daemon hardening, access control, passwordless SSH, SCP, and a review of users, groups, and sudo context.

**Architecture:** The lab will mirror the later-session structure already used in this repo: one student-facing scenario lab, one direct answer key, and one guarded prep script. The prep script creates namespaced users, groups, keys, sample files, and an SSH config backup, while the homework drives the student through real inspection and configuration of the VM’s SSH service.

**Tech Stack:** Markdown, Bash, standard Linux commands (`cat`, `grep`, `id`, `ls -l`, `ls -ld`, `sudo`, `useradd`, `groupadd`, `passwd`, `chmod`, `chown`, `chgrp`, `ssh`, `ssh-keygen`, `ssh-copy-id`, `scp`)

---

## File Structure

- Create: `docs/superpowers/specs/2026-06-24-session13-ssh-hardening-design.md`
  Already written and approved; use as the source of truth.
- Create: `session13/prepare-lab.sh`
  Real-system prep script that creates namespaced users/groups, lab notes, key material, sample SCP file, and an SSH config backup.
- Create: `session13/homework.md`
  Single student-facing scenario lab.
- Create: `session13/answers.md`
  Direct answer key with explanations and expected observations.

## Task 1: Scaffold Session 13 Files and Prep Script Header

**Files:**
- Create: `session13/prepare-lab.sh`
- Create: `session13/homework.md`
- Create: `session13/answers.md`

- [ ] **Step 1: Create the prep script header**

```bash
#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session13-lab"
```

- [ ] **Step 2: Create markdown file headers**

```markdown
# Linux for Beginners: Session 13 Homework
```

```markdown
# Linux for Beginners: Session 13 Answers
```

- [ ] **Step 3: Run syntax check on the prep script**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/prepare-lab.sh`
Expected: exit code `0` and no output

- [ ] **Step 4: Commit**

```bash
git add HomeWorks/session13/prepare-lab.sh HomeWorks/session13/homework.md HomeWorks/session13/answers.md
git commit -m "feat: scaffold session13 ssh lab files"
```

## Task 2: Implement Safe Real-System Prep for SSH Config and Lab Notes

**Files:**
- Modify: `session13/prepare-lab.sh`

- [ ] **Step 1: Detect SSH config path and create backup path**

```bash
SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_PATH="${LAB_DIR}/sshd_config.backup.$(date +%Y%m%d%H%M%S)"

mkdir -p "${LAB_DIR}"

if [ ! -f "${SSH_CONFIG}" ]; then
  echo "Could not find ${SSH_CONFIG}" >&2
  exit 1
fi

sudo cp "${SSH_CONFIG}" "${BACKUP_PATH}"
```

- [ ] **Step 2: Create lab notes skeleton**

```bash
cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 13 SSH lab prepared.

SSH config path: ${SSH_CONFIG}
SSH config backup: ${BACKUP_PATH}
EOF
```

- [ ] **Step 3: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 4: Commit**

```bash
git add HomeWorks/session13/prepare-lab.sh
git commit -m "feat: add session13 ssh config backup setup"
```

## Task 3: Add Namespaced Users and Group to Prep Script

**Files:**
- Modify: `session13/prepare-lab.sh`

- [ ] **Step 1: Add the lab SSH admin group**

```bash
if ! grep -q '^session13_sshadmins:' /etc/group; then
  sudo groupadd session13_sshadmins
fi
```

- [ ] **Step 2: Add the admin user and restricted user**

```bash
if ! grep -q '^session13_admin:' /etc/passwd; then
  sudo useradd -m -s /bin/bash session13_admin
fi

if ! grep -q '^session13_guest:' /etc/passwd; then
  sudo useradd -m -s /bin/bash session13_guest
fi
```

- [ ] **Step 3: Ensure admin user belongs to the SSH admin group**

```bash
sudo usermod -G session13_sshadmins session13_admin
```

- [ ] **Step 4: Add passwords for the lab users**

```bash
echo 'session13_admin:session13321' | sudo chpasswd
echo 'session13_guest:session13321' | sudo chpasswd
```

- [ ] **Step 5: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 6: Commit**

```bash
git add HomeWorks/session13/prepare-lab.sh
git commit -m "feat: add session13 ssh lab users and group"
```

## Task 4: Add Key Material and SCP Payload Preparation

**Files:**
- Modify: `session13/prepare-lab.sh`

- [ ] **Step 1: Add lab keypair generation**

```bash
KEY_PATH="${LAB_DIR}/session13_id_rsa"

if [ ! -f "${KEY_PATH}" ]; then
  ssh-keygen -t rsa -N "" -f "${KEY_PATH}"
fi
```

- [ ] **Step 2: Add SCP payload file**

```bash
cat > "${LAB_DIR}/scp-payload.txt" <<'EOF'
Session 13 SCP payload
This file is copied during the SSH lab.
EOF
```

- [ ] **Step 3: Append key and payload info to LAB_NOTES**

```bash
cat >> "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Admin user: session13_admin
Restricted user: session13_guest
SSH admin group: session13_sshadmins
Private key path: ${KEY_PATH}
Public key path: ${KEY_PATH}.pub
SCP payload path: ${LAB_DIR}/scp-payload.txt
EOF
```

- [ ] **Step 4: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 5: Commit**

```bash
git add HomeWorks/session13/prepare-lab.sh
git commit -m "feat: add session13 key and scp prep"
```

## Task 5: Add Final Prep Messaging and Minimal Safeguards

**Files:**
- Modify: `session13/prepare-lab.sh`

- [ ] **Step 1: Add final status output**

```bash
echo "Session 13 lab prepared at ${LAB_DIR}"
cat "${LAB_DIR}/LAB_NOTES.txt"
```

- [ ] **Step 2: Add safety reminder output**

```bash
echo
echo "Keep your current shell session open while testing SSH changes."
echo "Use the saved backup if you need to restore sshd_config."
```

- [ ] **Step 3: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 4: Commit**

```bash
git add HomeWorks/session13/prepare-lab.sh
git commit -m "feat: finish session13 prep script"
```

## Task 6: Write Homework Header, Scenario, Setup, and Notes

**Files:**
- Modify: `session13/homework.md`

- [ ] **Step 1: Add title, scenario, setup, and notes**

```markdown
# Linux for Beginners: Session 13 Homework

## Lab: SSH Hardening and Secure Remote Access

## Scenario

You are helping secure a Linux VM that will now be used for remote administration and file transfer. Your task is to inspect the current SSH setup, review which users and groups should have access, set up passwordless authentication for the correct admin user, harden root login, and safely verify the final SSH configuration.
```

- [ ] **Step 2: Add setup section referencing the prep script**

```markdown
## Environment Setup

Make the preparation script executable and run it:

```bash
chmod +x prepare-lab.sh
./prepare-lab.sh
```
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session13/homework.md
git commit -m "feat: scaffold session13 homework"
```

## Task 7: Add Review and SSH Basics Questions to Homework

**Files:**
- Modify: `session13/homework.md`

- [ ] **Step 1: Add review section for users, groups, and sudo context**

```markdown
## Part 1: Review of Access Controls, Users, Groups, and Sudo Context

### 1. Identify the lab admin user created by the prep script.
### 2. Identify the lab restricted user created by the prep script.
### 3. Identify the SSH admin group created by the prep script.
### 4. Use `id` to inspect the admin user’s UID, primary group, and supplementary groups.
### 5. Inspect `/etc/sudoers` and determine whether the lab admin user has a direct sudo rule or inherits sudo through group membership.
```

- [ ] **Step 2: Add SSH basics and inspection tasks**

```markdown
## Part 2: SSH Basics and Daemon Inspection

### 6. Identify the default port used by SSH.
### 7. If you run `ssh host-name`, determine which username is used by default.
### 8. Locate the SSH daemon configuration file.
### 9. Inspect the SSH daemon configuration and identify the current values or active lines for `PermitRootLogin`, `PasswordAuthentication`, and `PubkeyAuthentication`.
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session13/homework.md
git commit -m "feat: add session13 review and ssh basics tasks"
```

## Task 8: Add Key Authentication, Access Restriction, and SCP Tasks to Homework

**Files:**
- Modify: `session13/homework.md`

- [ ] **Step 1: Add passwordless SSH tasks**

```markdown
## Part 3: Passwordless SSH Authentication

### 10. Generate an RSA SSH key pair for this lab.
### 11. Identify the public key created by the previous command.
### 12. Copy the public key to the target account using `ssh-copy-id`.
### 13. State which file on the remote server stores the copied public key for login.
```

- [ ] **Step 2: Add `AllowUsers`, `AllowGroups`, and root-hardening tasks**

```markdown
## Part 4: SSH Access Restrictions and Root Hardening

### 14. Add an `AllowUsers` rule so only the prepared admin user is explicitly allowed.
### 15. Replace or extend the policy with `AllowGroups` using the prepared SSH admin group.
### 16. Disable direct root SSH login.
### 17. If key-based login for the admin user is working, disable password authentication.
```

- [ ] **Step 3: Add validation, reload, and SCP tasks**

```markdown
## Part 5: Validation, Reload, and SCP

### 18. Validate the SSH daemon configuration before reloading the service.
### 19. Reload or restart the SSH service safely.
### 20. Copy the prepared payload file to the remote admin user’s home directory using `scp`.
### 21. Verify that the copied file arrived in the correct destination.
```

- [ ] **Step 4: Commit**

```bash
git add HomeWorks/session13/homework.md
git commit -m "feat: complete session13 homework tasks"
```

## Task 9: Write Answers for Review and SSH Basics

**Files:**
- Modify: `session13/answers.md`

- [ ] **Step 1: Add answer sections for the review tasks**

```markdown
### 1. Identify the lab admin user created by the prep script.

Answer:

Use:

```bash
cat "$HOME/session13-lab/LAB_NOTES.txt"
```
```

- [ ] **Step 2: Add SSH basics answers**

```markdown
### 6. Identify the default port used by SSH.

Answer:

The default SSH port is `22`.
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session13/answers.md
git commit -m "feat: add session13 review and ssh basics answers"
```

## Task 10: Write Answers for Key Auth, Access Control, and SCP

**Files:**
- Modify: `session13/answers.md`

- [ ] **Step 1: Add key-generation and `ssh-copy-id` answers**

```markdown
### 10. Generate an RSA SSH key pair for this lab.

Answer:

```bash
ssh-keygen -t rsa
```
```

- [ ] **Step 2: Add access-restriction and root-hardening answers**

```markdown
### 16. Disable direct root SSH login.

Answer:

Edit `/etc/ssh/sshd_config` and set:

```text
PermitRootLogin no
```
```

- [ ] **Step 3: Add validation, reload, and SCP answers**

```markdown
### 18. Validate the SSH daemon configuration before reloading the service.

Answer:

```bash
sudo sshd -t
```
```

- [ ] **Step 4: Commit**

```bash
git add HomeWorks/session13/answers.md
git commit -m "feat: complete session13 answers"
```

## Task 11: Run Final Verification for Session 13 Files

**Files:**
- Verify: `session13/prepare-lab.sh`
- Verify: `session13/homework.md`
- Verify: `session13/answers.md`

- [ ] **Step 1: Run shell syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 2: Review homework content**

Run: `sed -n '1,260p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/homework.md`
Expected: one continuous SSH scenario-based lab with all sections present

- [ ] **Step 3: Review answer key content**

Run: `sed -n '1,320p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session13/answers.md`
Expected: answers and explanations for every task

- [ ] **Step 4: Commit the final verified state**

```bash
git add HomeWorks/session13/homework.md HomeWorks/session13/answers.md HomeWorks/session13/prepare-lab.sh
git commit -m "feat: finalize session13 ssh lab"
```

## Self-Review

- Spec coverage: the plan covers the approved review section, the SSH daemon tasks, passwordless SSH, `AllowUsers` and `AllowGroups`, root hardening, safe validation/reload, and SCP.
- Placeholder scan: all files, commands, and task groups are concrete.
- Naming consistency: all users, groups, paths, and filenames are session13-prefixed and reused consistently.

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-06-24-session13-ssh-hardening-plan.md`. Two execution options:

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch execution with checkpoints

Which approach?
