# Session 13 SSH Hardening Lab Design

## Objective

Create a single scenario-based Session 13 lab that teaches:

- review of access controls, users, groups, and sudo context
- SSH service basics
- SSH daemon configuration
- user and group based SSH access control
- passwordless SSH authentication
- root SSH hardening
- secure SSH validation and reload workflow
- SCP file transfer over SSH

The lab must stay within commands and concepts already taught up to this point in the course, plus the SSH and SCP concepts introduced in this session.

## Deliverables

The implementation will add:

- `session13/homework.md`
- `session13/answers.md`
- `session13/prepare-lab.sh`

## Scenario

The student is helping secure a small Linux VM that will now be used for remote administration and file transfer. The VM already exists and is the real machine used for the lab. The student must inspect the SSH daemon configuration, prepare the correct users and groups for remote access, enable passwordless SSH for the right account, restrict access for the wrong account, harden root login, validate the daemon configuration, reload the SSH service safely, and finally transfer a file with `scp`.

## Constraints

- The lab must work on the student’s real VM, not just on a fake sandbox.
- The prep script must not blindly overwrite the live SSH daemon configuration.
- The homework must warn the student to keep the current SSH session open while testing changes.
- The prep script must create a rollback note and a real backup of the SSH configuration file.
- Do not use KodeKloud names or branding.
- Use only commands and concepts already covered in prior sessions, plus the SSH/SCP commands from this session.
- Keep the exercise reproducible with namespaced users, groups, keys, and sample files.

## Allowed Command and Concept Set

The answer key may use:

- `cat`
- `grep`
- `id`
- `ls -l`
- `ls -ld`
- `sudo`
- `useradd`
- `groupadd`
- `passwd`
- `chmod`
- `chown`
- `chgrp`
- `ssh`
- `ssh-keygen`
- `ssh-copy-id`
- `scp`

The homework may also rely on editing the SSH daemon configuration file directly, since SSH configuration is the new topic for this session.

## Lab Structure

The lab will be one continuous homework file with the following parts:

1. Review of access controls, users, groups, and sudo context
2. SSH basics and daemon inspection
3. User and group preparation for SSH access
4. Passwordless SSH authentication
5. SSH access restrictions with `AllowUsers` and `AllowGroups`
6. Root SSH hardening
7. SSH validation, reload, and rollback awareness
8. SCP file transfer

## Preparation Script Design

`prepare-lab.sh` will:

- detect the SSH daemon configuration path, expected to be `/etc/ssh/sshd_config`
- create `$HOME/session13-lab`
- create a `LAB_NOTES.txt` file with usernames, groups, paths, and rollback notes
- create a timestamped backup of the active SSH daemon configuration
- create or normalize namespaced lab users:
  - one admin-style SSH user
  - one user that should be restricted later
- create a namespaced admin group used for `AllowGroups`
- generate a lab SSH keypair in a predictable location if missing
- create a sample file in the student’s home directory for the SCP task
- avoid changing the live SSH config automatically

Suggested namespaced objects:

- `session13_admin`
- `session13_guest`
- `session13_sshadmins`

Suggested lab assets:

- `$HOME/session13-lab/LAB_NOTES.txt`
- `$HOME/session13-lab/session13_id_rsa`
- `$HOME/session13-lab/session13_id_rsa.pub`
- `$HOME/session13-lab/scp-payload.txt`

## Homework Content Plan

### Part 1: Review of Access Controls, Users, Groups, and Sudo Context

Tasks in this section will cover:

- identifying the lab admin user and the restricted user
- identifying the SSH admin group
- reviewing the user’s UID, primary group, and supplementary groups
- reviewing where sudo policy is defined
- checking whether the admin user already has sudo access and how that relates to the SSH hardening work

These review tasks are meant to refresh the account, group, and access-control concepts from the previous session before the student starts changing SSH behavior.

### Part 2: SSH Basics and Inspection

Tasks in this section will cover:

- identifying the default SSH port
- identifying which username is used when running `ssh <host>`
- locating the SSH daemon configuration file
- inspecting whether key directives already exist in the config:
  - `PermitRootLogin`
  - `PasswordAuthentication`
  - `PubkeyAuthentication`
  - `AllowUsers`
  - `AllowGroups`

### Part 3: User and Group Preparation

Tasks in this section will cover:

- identifying the lab admin user
- identifying the lab restricted user
- identifying the lab SSH admin group
- inspecting the account and group details with:
  - `id`
  - `/etc/passwd`
  - `/etc/group`

### Part 4: Passwordless SSH Authentication

Tasks in this section will cover:

- generating an SSH keypair with `ssh-keygen`
- identifying the public key path
- copying the public key to the target account with `ssh-copy-id`
- understanding that the key lands in `~/.ssh/authorized_keys`
- fixing ownership and permissions for `.ssh` and `authorized_keys` if needed

### Part 5: SSH Access Restrictions

Tasks in this section will cover:

- allowing one user explicitly with `AllowUsers`
- then shifting to a more maintainable group-based allow model with `AllowGroups`
- understanding why `AllowGroups` is often preferable for admin teams

The homework should use both so the student sees the difference between direct user allowlists and group-based policy.

### Part 6: Root SSH Hardening

Tasks in this section will cover:

- restricting or disabling root SSH login
- understanding why direct root SSH access is risky
- optionally disabling password authentication after key-based admin login is working

### Part 7: Validation and Safe Service Reload

Tasks in this section will cover:

- validating the SSH daemon configuration before reload
- reloading or restarting the SSH service safely
- keeping the active session open while testing
- knowing the backup path if rollback is needed

### Part 8: SCP

Tasks in this section will cover:

- copying a file from the student’s account to the remote target user over SSH
- verifying that the file arrives in the correct home directory
- using the same user and host information already established earlier in the lab

## Difficulty and Progression

The lab should begin with simple SSH inspection tasks, move into authentication setup, then progress into real daemon hardening and access control changes. SCP should come near the end, after the student has already established working authenticated SSH access.

Target length:

- approximately 12 to 16 questions

## Answers File Design

`answers.md` will include for each question:

- the expected command or command pattern
- a short explanation addressed directly to the student
- the expected observation or outcome

The answer key must avoid introducing extra tools beyond the approved command set.

## Verification Strategy

The homework will direct the student to verify results with:

- `grep` against the SSH configuration file
- `id`
- `ls -l` / `ls -ld`
- successful key installation and SSH access behavior
- presence of the transferred SCP file in the correct destination

## Risks and Mitigations

### Risk: Student locks themselves out of SSH

Mitigation:

- instruct the student to keep the current session open
- validate config before reload
- save the backup path in `LAB_NOTES.txt`

### Risk: Real-system config differs across distros

Mitigation:

- inspect the live SSH configuration path in the prep script
- avoid assuming every directive already exists
- teach the student to search the file and add directives as needed

### Risk: Lab users or groups collide with pre-existing system state

Mitigation:

- use `session13_`-prefixed names
- normalize those names in the prep script

### Risk: Student uses password auth after hardening

Mitigation:

- sequence the lab so passwordless authentication is working before the stronger SSH restrictions are applied

## Implementation Plan Summary

Implement Session 13 as one real-system SSH hardening and SCP lab with:

- one prep script
- one homework file
- one answers file

The prep script prepares users, groups, keys, notes, and a rollback backup, while the student performs the real SSH daemon inspection, authentication setup, access restrictions, service reload, and SCP transfer work on the VM itself.
