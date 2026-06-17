# Session 12 Security and Permissions Lab Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a self-contained Session 12 lab with one scenario-based homework file, one answer key, and one prep script covering account types, sudo inspection, access control files, users and groups, permissions, ownership, and special file concepts.

**Architecture:** The lab will mirror Session 11’s structure: a single student-facing homework file plus a direct answer key and a prep script that creates all lab-specific users, groups, directories, files, and intentionally broken states. The prep script keeps mutable practice data inside `$HOME/session12-lab` while using session-prefixed system accounts and groups for the account and ownership tasks.

**Tech Stack:** Markdown, Bash, standard Linux commands (`id`, `who`, `last`, `cat`, `grep`, `ls -l`, `ls -ld`, `useradd`, `groupadd`, `passwd`, `chmod`, `chown`, `chgrp`, `sudo`)

---

## File Structure

- Create: `docs/superpowers/specs/2026-06-17-session12-security-permissions-design.md`
  Already written and approved; use as the source of truth.
- Create: `session12/homework.md`
  Student-facing scenario lab with 14-18 tasks.
- Create: `session12/answers.md`
  Direct answer key with command patterns, explanations, and expected observations.
- Create: `session12/prepare-lab.sh`
  Reproducible prep script creating lab users, groups, filesystem layout, and notes.

## Task 1: Create Session 12 Directory and Prep Script Skeleton

**Files:**
- Create: `session12/prepare-lab.sh`

- [ ] **Step 1: Write the initial prep script skeleton**

```bash
#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session12-lab"

mkdir -p "${LAB_DIR}"

echo "Session 12 prep starting..."
```

- [ ] **Step 2: Run shell syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/prepare-lab.sh`
Expected: exit code `0` and no output

- [ ] **Step 3: Commit the skeleton**

```bash
git add HomeWorks/session12/prepare-lab.sh
git commit -m "feat: scaffold session12 prep script"
```

## Task 2: Add Session-Scoped Users and Groups to Prep Script

**Files:**
- Modify: `session12/prepare-lab.sh`

- [ ] **Step 1: Add namespaced users and groups**

```bash
GROUPS=(
  session12_mercury
  session12_sapphire
  session12_cannon
)

for group in "${GROUPS[@]}"; do
  if ! grep -q "^${group}:" /etc/group; then
    sudo groupadd "${group}"
  fi
done

if ! grep -q '^session12_alex:' /etc/passwd; then
  sudo useradd -m -s /bin/bash session12_alex
fi

if ! grep -q '^session12_service:' /etc/passwd; then
  sudo useradd -M -s /usr/sbin/nologin session12_service
fi
```

- [ ] **Step 2: Add one user with explicit UID, group, shell, and home**

```bash
if ! grep -q '^session12_chris:' /etc/passwd; then
  sudo useradd -u 2012 -g session12_cannon -d /home/session12_chris -s /bin/sh -c "Session 12 Analyst" session12_chris
fi
```

- [ ] **Step 3: Run shell syntax check again**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 4: Commit the user/group setup**

```bash
git add HomeWorks/session12/prepare-lab.sh
git commit -m "feat: create session12 users and groups"
```

## Task 3: Add Group Membership and Password Steps to Prep Script

**Files:**
- Modify: `session12/prepare-lab.sh`

- [ ] **Step 1: Add secondary group membership commands**

```bash
sudo usermod -aG session12_mercury,session12_sapphire session12_chris
```

- [ ] **Step 2: Add lab password setup**

```bash
echo 'session12_alex:session12321' | sudo chpasswd
echo 'session12_chris:session12321' | sudo chpasswd
```

- [ ] **Step 3: Verify syntax**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 4: Commit membership and password setup**

```bash
git add HomeWorks/session12/prepare-lab.sh
git commit -m "feat: add session12 group membership and passwords"
```

## Task 4: Add Filesystem Lab State to Prep Script

**Files:**
- Modify: `session12/prepare-lab.sh`

- [ ] **Step 1: Create project directories and files**

```bash
mkdir -p "${LAB_DIR}"/projects/{sports,shared,secure}
touch "${LAB_DIR}/projects/sports/soccer"
touch "${LAB_DIR}/projects/sports/tennis"
touch "${LAB_DIR}/projects/shared/report.txt"
```

- [ ] **Step 2: Add intentionally broken ownership and permissions**

```bash
chmod 777 "${LAB_DIR}/projects/sports/soccer"
chmod 750 "${LAB_DIR}/projects/sports"
sudo chown session12_alex:session12_mercury "${LAB_DIR}/projects/sports/soccer"
sudo chown -R session12_alex:session12_mercury "${LAB_DIR}/projects/shared"
```

- [ ] **Step 3: Create special-file examples**

```bash
ln -sf "${LAB_DIR}/projects/shared/report.txt" "${LAB_DIR}/report-link"
mkfifo "${LAB_DIR}/lab-pipe"
```

- [ ] **Step 4: Verify syntax**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 5: Commit filesystem lab state**

```bash
git add HomeWorks/session12/prepare-lab.sh
git commit -m "feat: add session12 filesystem permission scenarios"
```

## Task 5: Add LAB_NOTES Output and Final Prep Script Messaging

**Files:**
- Modify: `session12/prepare-lab.sh`

- [ ] **Step 1: Write `LAB_NOTES.txt` with exact values**

```bash
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
```

- [ ] **Step 2: Add final status output**

```bash
echo "Session 12 lab prepared at ${LAB_DIR}"
cat "${LAB_DIR}/LAB_NOTES.txt"
```

- [ ] **Step 3: Verify syntax**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 4: Commit the completed prep script**

```bash
git add HomeWorks/session12/prepare-lab.sh
git commit -m "feat: finish session12 prep script"
```

## Task 6: Write Homework Header, Scenario, Setup, and Notes

**Files:**
- Create: `session12/homework.md`

- [ ] **Step 1: Add title, scenario, setup, and notes**

```markdown
# Linux for Beginners: Session 12 Homework

## Lab: Security, Accounts, and File Permissions

## Scenario

You are helping secure and organize a small shared Linux training server. Several users, groups, directories, and file permissions were configured in a hurry. Your task is to inspect account information, verify privilege boundaries, create missing users and groups, and repair ownership and permissions on shared project files.

## Environment Setup

Make the preparation script executable and run it:

```bash
chmod +x prepare-lab.sh
./prepare-lab.sh
```

The script creates a practice lab under:

```text
$HOME/session12-lab
```
```

- [ ] **Step 2: Verify file exists**

Run: `sed -n '1,80p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/homework.md`
Expected: markdown header and setup section printed

- [ ] **Step 3: Commit the homework scaffold**

```bash
git add HomeWorks/session12/homework.md
git commit -m "feat: scaffold session12 homework"
```

## Task 7: Add Account Inspection and Sudo Questions to Homework

**Files:**
- Modify: `session12/homework.md`

- [ ] **Step 1: Add Part 1 account inspection questions**

```markdown
## Part 1: Accounts and Basic Security

### 1. Identify which prepared account is a standard user account.
### 2. Identify which prepared account is a service account.
### 3. Identify the superuser account on the system.
### 4. Find the UID and primary GID of `session12_chris`.
### 5. Check which groups `session12_chris` belongs to.
### 6. Use `who` to inspect currently logged-in users.
### 7. Use `last` to inspect recent login history.
```

- [ ] **Step 2: Add Part 2 sudo and access-control questions**

```markdown
## Part 2: Sudo and Access Control Files

### 8. Identify which file stores account metadata.
### 9. Identify which file stores encrypted password entries.
### 10. Identify which file stores group metadata.
### 11. Identify which file controls sudo policy.
### 12. Inspect the sudo policy and determine what `session12_alex` is allowed to run.
```

- [ ] **Step 3: Commit the inspection questions**

```bash
git add HomeWorks/session12/homework.md
git commit -m "feat: add session12 account and sudo questions"
```

## Task 8: Add User/Group Creation and Permission Repair Questions to Homework

**Files:**
- Modify: `session12/homework.md`

- [ ] **Step 1: Add user and group operation tasks**

```markdown
## Part 3: Users and Groups Operations

### 13. Create a new user named `session12_sarah` and set the password to `session12321`.
### 14. Create a group named `session12_john` with GID `2010`.
### 15. Create a user named `session12_john` with UID `2010`, primary group `session12_john`, login shell `/bin/sh`, and home directory `/home/session12_john`.
```

- [ ] **Step 2: Add permission and ownership tasks**

```markdown
## Part 4: Permissions and Ownership

### 16. Inspect the permissions of `$HOME/session12-lab/projects/sports`.
### 17. Change the file `soccer` so group and others have only read and execute permissions.
### 18. Add write permission back for group and remove all permissions for others on `soccer`.
### 19. Change ownership of `soccer` to the service account `session12_service` and group `session12_mercury`.
### 20. Change ownership of the entire `shared` directory recursively to `session12_service:session12_mercury`.
### 21. Identify the special file types created in the lab from `ls -l` output.
```

- [ ] **Step 3: Commit the remaining homework tasks**

```bash
git add HomeWorks/session12/homework.md
git commit -m "feat: complete session12 homework tasks"
```

## Task 9: Write Answers for Account Inspection and Sudo

**Files:**
- Create: `session12/answers.md`

- [ ] **Step 1: Add answer sections for the first twelve questions**

```markdown
### 1. Identify which prepared account is a standard user account.

Answer:

Use:

```bash
grep '^session12_alex:' /etc/passwd
```

Description:

In this question, you learn how to identify a regular user account from `/etc/passwd`.
```

- [ ] **Step 2: Add direct command-based answers for `/etc/passwd`, `/etc/shadow`, `/etc/group`, and `/etc/sudoers`**

```markdown
### 11. Identify which file controls sudo policy.

Answer:

```bash
cat /etc/sudoers
```
```

- [ ] **Step 3: Commit the first answer section**

```bash
git add HomeWorks/session12/answers.md
git commit -m "feat: add session12 account and sudo answers"
```

## Task 10: Write Answers for User/Group Operations and Permission Tasks

**Files:**
- Modify: `session12/answers.md`

- [ ] **Step 1: Add user and group creation answers**

```markdown
### 13. Create a new user named `session12_sarah` and set the password to `session12321`.

Answer:

```bash
sudo useradd session12_sarah
sudo passwd session12_sarah
```
```

- [ ] **Step 2: Add permission and ownership repair answers**

```markdown
### 17. Change the file `soccer` so group and others have only read and execute permissions.

Answer:

```bash
chmod go=rx "$HOME/session12-lab/projects/sports/soccer"
```
```

- [ ] **Step 3: Add special-file identification answers**

```markdown
### 21. Identify the special file types created in the lab from `ls -l` output.

Answer:

Use:

```bash
ls -l "$HOME/session12-lab"
```

Expected observations:

- `l` for the symbolic link
- `p` for the pipe
```

- [ ] **Step 4: Commit the completed answer key**

```bash
git add HomeWorks/session12/answers.md
git commit -m "feat: complete session12 answers"
```

## Task 11: Run Final Verification and Review Session 12 Files

**Files:**
- Verify: `session12/homework.md`
- Verify: `session12/answers.md`
- Verify: `session12/prepare-lab.sh`

- [ ] **Step 1: Run shell syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 2: Review homework content**

Run: `sed -n '1,260p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/homework.md`
Expected: one continuous scenario-based homework with all sections present

- [ ] **Step 3: Review answer key content**

Run: `sed -n '1,360p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session12/answers.md`
Expected: direct answers and explanations for each task

- [ ] **Step 4: Commit the final verified state**

```bash
git add HomeWorks/session12/homework.md HomeWorks/session12/answers.md HomeWorks/session12/prepare-lab.sh
git commit -m "feat: finalize session12 security lab"
```

## Self-Review

- Spec coverage: every approved requirement maps to a prep-script section or a homework task.
- Placeholder scan: no TBD/TODO markers; all file paths and command shapes are concrete.
- Type consistency: session-prefixed user/group names are reused consistently across prep script, homework, and answers.

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-06-17-session12-security-permissions-plan.md`. Two execution options:

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch execution with checkpoints

Which approach?
