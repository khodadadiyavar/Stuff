# Session 14 DNS Lab Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a real-system Session 14 DNS troubleshooting lab with one scenario-based homework file, one answer key, and one prep script covering DNS commands, name resolution order, and DNS-related configuration files.

**Architecture:** The lab follows the later-session pattern: a single student-facing scenario lab, a direct answer key, and a guarded prep script. The prep script only prepares notes and backups of real system files, while the student performs the actual DNS inspection and configuration edits on the VM.

**Tech Stack:** Markdown, Bash, standard Linux commands (`hostname`, `cat`, `grep`, `sudo`, `dig`, `nslookup`)

---

## File Structure

- Create: `docs/superpowers/specs/2026-07-01-session14-dns-design.md`
  Already written and approved; use as the source of truth.
- Create: `session14/prepare-lab.sh`
  Prep script that creates the lab directory, backs up DNS-related config files, and writes notes.
- Create: `session14/homework.md`
  Single student-facing DNS troubleshooting lab.
- Create: `session14/answers.md`
  Direct answer key with explanations and expected observations.

## Task 1: Scaffold Session 14 Files and Prep Script Header

**Files:**
- Create: `session14/prepare-lab.sh`
- Create: `session14/homework.md`
- Create: `session14/answers.md`

- [ ] **Step 1: Create the prep script header**

```bash
#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="${HOME}/session14-lab"
```

- [ ] **Step 2: Create markdown file headers**

```markdown
# Linux for Beginners: Session 14 Homework
```

```markdown
# Linux for Beginners: Session 14 Answers
```

- [ ] **Step 3: Run syntax check on the prep script**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session14/prepare-lab.sh`
Expected: exit code `0` and no output

- [ ] **Step 4: Commit**

```bash
git add HomeWorks/session14/prepare-lab.sh HomeWorks/session14/homework.md HomeWorks/session14/answers.md
git commit -m "feat: scaffold session14 dns lab files"
```

## Task 2: Implement DNS Backup and Notes Prep

**Files:**
- Modify: `session14/prepare-lab.sh`

- [ ] **Step 1: Define real DNS-related file paths and backup locations**

```bash
HOSTS_FILE="/etc/hosts"
RESOLV_FILE="/etc/resolv.conf"
NSSWITCH_FILE="/etc/nsswitch.conf"

HOSTS_BACKUP="${LAB_DIR}/hosts.backup"
RESOLV_BACKUP="${LAB_DIR}/resolv.conf.backup"
NSSWITCH_BACKUP="${LAB_DIR}/nsswitch.conf.backup"
```

- [ ] **Step 2: Create the lab directory and validate required files**

```bash
mkdir -p "${LAB_DIR}"

for file in "${HOSTS_FILE}" "${RESOLV_FILE}" "${NSSWITCH_FILE}"; do
  if [ ! -f "${file}" ]; then
    echo "Missing required file: ${file}" >&2
    exit 1
  fi
done
```

- [ ] **Step 3: Back up the live files**

```bash
sudo cp "${HOSTS_FILE}" "${HOSTS_BACKUP}"
sudo cp "${RESOLV_FILE}" "${RESOLV_BACKUP}"
sudo cp "${NSSWITCH_FILE}" "${NSSWITCH_BACKUP}"
```

- [ ] **Step 4: Write the initial notes file**

```bash
cat > "${LAB_DIR}/LAB_NOTES.txt" <<EOF
Session 14 DNS lab prepared.

Hosts file backup: ${HOSTS_BACKUP}
resolv.conf backup: ${RESOLV_BACKUP}
nsswitch.conf backup: ${NSSWITCH_BACKUP}
EOF
```

- [ ] **Step 5: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session14/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 6: Commit**

```bash
git add HomeWorks/session14/prepare-lab.sh
git commit -m "feat: add session14 dns backup setup"
```

## Task 3: Add Lab Notes, Rollback Guidance, and Safety Messaging

**Files:**
- Modify: `session14/prepare-lab.sh`

- [ ] **Step 1: Append rollback guidance to LAB_NOTES**

```bash
cat >> "${LAB_DIR}/LAB_NOTES.txt" <<EOF

Rollback examples:
sudo cp ${HOSTS_BACKUP} ${HOSTS_FILE}
sudo cp ${RESOLV_BACKUP} ${RESOLV_FILE}
sudo cp ${NSSWITCH_BACKUP} ${NSSWITCH_FILE}
EOF
```

- [ ] **Step 2: Add example investigation notes**

```bash
cat >> "${LAB_DIR}/LAB_NOTES.txt" <<'EOF'

Use this lab to compare:
- answers from /etc/hosts
- answers from DNS
- answers affected by search order
EOF
```

- [ ] **Step 3: Add final status output**

```bash
echo "Session 14 lab prepared at ${LAB_DIR}"
cat "${LAB_DIR}/LAB_NOTES.txt"
```

- [ ] **Step 4: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session14/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 5: Commit**

```bash
git add HomeWorks/session14/prepare-lab.sh
git commit -m "feat: finish session14 prep script"
```

## Task 4: Write Homework Header, Scenario, Setup, and Notes

**Files:**
- Modify: `session14/homework.md`

- [ ] **Step 1: Add title, scenario, setup, and notes**

```markdown
# Linux for Beginners: Session 14 Homework

## Lab: DNS Troubleshooting and Name Resolution

## Scenario

You are helping diagnose and fix name-resolution problems on a Linux VM. Some lookups should come from the local host file, while others should come from DNS. Your job is to inspect the current DNS-related configuration, compare command output, make controlled changes, and explain why the observed behavior changes.
```

- [ ] **Step 2: Add setup section**

```markdown
## Environment Setup

From the `session14` directory:

```bash
chmod +x prepare-lab.sh
./prepare-lab.sh
cat ~/session14-lab/LAB_NOTES.txt
```
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session14/homework.md
git commit -m "feat: scaffold session14 homework"
```

## Task 5: Add DNS Inspection and Command Questions

**Files:**
- Modify: `session14/homework.md`

- [ ] **Step 1: Add DNS inspection tasks**

```markdown
## Part 1: DNS Inspection

### 1. Check the current hostname of the VM.
### 2. Identify the configured nameserver or nameservers used by this system.
### 3. Identify the configured search domain, if one is present.
### 4. Identify which file is responsible for host file-based name resolution.
### 5. Identify which file stores DNS resolver nameserver configuration.
### 6. Inspect `/etc/nsswitch.conf` and determine whether the system checks `files` before `dns`, or `dns` before `files`.
```

- [ ] **Step 2: Add command-practice tasks**

```markdown
## Part 2: DNS Command Practice

### 7. Use `dig` to resolve a test domain and record the answer.
### 8. Use `nslookup` to resolve the same test domain and compare the result.
### 9. Explain whether the two commands agree on the answer on your system.
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session14/homework.md
git commit -m "feat: add session14 dns inspection tasks"
```

## Task 6: Add Controlled Change and Reasoning Tasks

**Files:**
- Modify: `session14/homework.md`

- [ ] **Step 1: Add live configuration change tasks**

```markdown
## Part 3: Controlled DNS Configuration Changes

### 10. Change the system nameserver to `8.8.8.8`.
### 11. Change the search domain to a new test domain of your choice and record it.
### 12. Change the lookup order in `/etc/nsswitch.conf` so that `dns` is checked before `files`.
```

- [ ] **Step 2: Add reasoning and verification tasks**

```markdown
## Part 4: Reasoning and Troubleshooting

### 13. After changing the lookup order, explain how host resolution behavior changes.
### 14. Determine whether a chosen test result is coming from `/etc/hosts` or from DNS and explain why.
### 15. Use the backup notes to describe how you would restore the original DNS-related files if needed.
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session14/homework.md
git commit -m "feat: complete session14 homework tasks"
```

## Task 7: Write Answers for DNS Inspection and Commands

**Files:**
- Modify: `session14/answers.md`

- [ ] **Step 1: Add answers for hostname, nameserver, search domain, and DNS-related files**

```markdown
## 1. Check the current hostname of the VM.

### Command

```bash
hostname
```
```

- [ ] **Step 2: Add answers for `dig` and `nslookup`**

```markdown
## 7. Use `dig` to resolve a test domain and record the answer.

### Command

```bash
dig example.com
```
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session14/answers.md
git commit -m "feat: add session14 dns inspection answers"
```

## Task 8: Write Answers for Configuration Changes and Reasoning

**Files:**
- Modify: `session14/answers.md`

- [ ] **Step 1: Add answers for changing nameserver, search domain, and nsswitch order**

```markdown
## 10. Change the system nameserver to `8.8.8.8`.

### Action

Edit `/etc/resolv.conf` and set:

```text
nameserver 8.8.8.8
```
```

- [ ] **Step 2: Add reasoning and rollback answers**

```markdown
## 15. Use the backup notes to describe how you would restore the original DNS-related files if needed.

### Command

```bash
cat ~/session14-lab/LAB_NOTES.txt
```
```

- [ ] **Step 3: Commit**

```bash
git add HomeWorks/session14/answers.md
git commit -m "feat: complete session14 dns answers"
```

## Task 9: Final Verification

**Files:**
- Verify: `session14/prepare-lab.sh`
- Verify: `session14/homework.md`
- Verify: `session14/answers.md`

- [ ] **Step 1: Run syntax check**

Run: `bash -n /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session14/prepare-lab.sh`
Expected: exit code `0`

- [ ] **Step 2: Review homework content**

Run: `sed -n '1,260p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session14/homework.md`
Expected: one continuous DNS scenario-based lab with all sections present

- [ ] **Step 3: Review answer key content**

Run: `sed -n '1,320p' /Users/yavar/personal-repos/Linux\ Basics/HomeWorks/session14/answers.md`
Expected: answers and explanations for every task

- [ ] **Step 4: Commit the final verified state**

```bash
git add HomeWorks/session14/homework.md HomeWorks/session14/answers.md HomeWorks/session14/prepare-lab.sh
git commit -m "feat: finalize session14 dns lab"
```

## Self-Review

- Spec coverage: the plan covers hostname, DNS commands, resolver files, lookup-order changes, search domain changes, and rollback notes.
- Placeholder scan: all file paths, filenames, and task groups are concrete.
- Naming consistency: the lab consistently uses the `session14-lab` path and the three DNS-related system files.

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-07-01-session14-dns-plan.md`. Two execution options:

**1. Subagent-Driven (recommended)** - I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch execution with checkpoints

Which approach?
