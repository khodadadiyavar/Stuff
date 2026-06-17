# Session 12 Security and Permissions Lab Design

## Objective

Create a single scenario-based Session 12 homework lab that teaches:

- security basics and account types
- sudo usage and sudo policy inspection
- access control files
- users and groups plus user/group operations
- managing file permissions and ownership
- special file and directory concepts

The lab must stay within commands and concepts already taught in earlier sessions.

## Deliverables

The implementation will add:

- `session12/homework.md`
- `session12/answers.md`
- `session12/prepare-lab.sh`

## Scenario

The student takes over a small shared Linux training server after a rushed onboarding. Several users, groups, project directories, and file permissions were configured inconsistently. The student must inspect account information, verify privilege boundaries, create missing users and groups, and repair ownership and permissions on shared project files.

## Constraints

- Do not use KodeKloud names or branding.
- Keep the lab self-contained, similar to Session 11.
- Use only commands and concepts already covered:
  - `id`
  - `who`
  - `last`
  - `cat`
  - `grep`
  - `ls -l`
  - `ls -ld`
  - `useradd`
  - `groupadd`
  - `passwd`
  - `chmod`
  - `chown`
  - `chgrp`
  - `sudo`
- Do not use ACL tools, `visudo` edits, or advanced security tooling not already taught.
- Namespace all created users, groups, and directories to avoid collisions with existing system state.

## Lab Structure

The lab will be one continuous homework file with four parts:

1. Account inspection and account types
2. Sudo and access control files
3. Users and groups operations
4. File permissions, ownership, and special file/directory interpretation

## Preparation Script Design

`prepare-lab.sh` will:

- create a lab directory at `$HOME/session12-lab`
- create a `LAB_NOTES.txt` file with the exact usernames, groups, and target paths
- create one standard user for inspection
- create one service-style user with a non-login shell for identification tasks
- create one or more groups with known membership for group queries
- create a shared project directory tree with intentionally incorrect ownership and permissions
- create files whose permissions need to be changed with both symbolic and numeric modes
- create examples that let the student inspect file type indicators from `ls -l`

The script will avoid destructive changes outside the lab scope and will use clearly prefixed account names such as:

- `session12_alex`
- `session12_chris`
- `session12_sarah`
- `session12_service`
- `session12_mercury`
- `session12_sapphire`

## Homework Content Plan

### Part 1: Accounts and Basic Security

Tasks in this section will cover:

- identifying a standard user account
- identifying a service account
- identifying the superuser account
- determining a user's UID and primary GID
- checking current login information with `who`
- checking historical login information with `last`

The student will answer using:

- `id`
- `who`
- `last`
- `grep ... /etc/passwd`

### Part 2: Sudo and Access Control Files

Tasks in this section will cover:

- which file stores account metadata (`/etc/passwd`)
- which file stores encrypted password entries (`/etc/shadow`)
- which file stores group metadata (`/etc/group`)
- which file governs sudo policy (`/etc/sudoers`)
- which sudo privileges a prepared user has

The student will inspect these files with:

- `cat`
- `grep`

No file editing of `/etc/sudoers` is required; inspection only.

### Part 3: Users and Groups Operations

Tasks in this section will cover:

- creating a new user
- setting a password for a user
- creating a group with a specific GID
- creating a user with:
  - a specific UID
  - a specific primary group
  - a specific login shell
  - a specific home directory
- identifying group membership and primary group relationships

The student will use:

- `useradd`
- `groupadd`
- `passwd`
- `id`
- `grep`

### Part 4: Permissions and Ownership

Tasks in this section will cover:

- interpreting symbolic permissions from `ls -l`
- interpreting numeric permissions such as `777`, `755`, `660`, `750`
- changing permissions with symbolic mode
- changing permissions with numeric mode
- changing ownership with `chown`
- changing group ownership with `chgrp`
- recursively fixing ownership with `chown -R`
- distinguishing file types by the first character in long listing output:
  - regular file `-`
  - directory `d`
  - link `l`
  - pipe `p`

The student will use:

- `ls -l`
- `ls -ld`
- `chmod`
- `chown`
- `chgrp`

## Difficulty and Progression

The lab should start with straightforward inspection tasks, then move into repair tasks:

- early questions: inspect and classify
- middle questions: create users/groups and verify results
- later questions: repair broken ownership and permissions on project files
- final questions: combine inspection and correction into realistic admin work

Target length:

- approximately 14 to 18 questions

## Answers File Design

`answers.md` will include for each question:

- the expected command or valid command pattern
- a short explanation addressed directly to the student
- the expected observation or result

The answers must not introduce new commands beyond the allowed set.

## Verification Strategy

The homework will direct the student to verify results with:

- `id`
- `grep` against `/etc/passwd`, `/etc/shadow`, and `/etc/group`
- `ls -l`
- `ls -ld`
- `cat` on produced notes or lab files

## Risks and Mitigations

### Risk: User/group creation collides with existing system state

Mitigation:

- use unique session-prefixed names
- provide the exact names in `LAB_NOTES.txt`

### Risk: Student machine permissions vary

Mitigation:

- explicitly note when `sudo` is required
- keep all mutable filesystem tasks inside `$HOME/session12-lab`

### Risk: Solutions drift beyond taught material

Mitigation:

- restrict the answer key to previously taught commands only
- avoid advanced admin or security tooling

## Implementation Plan Summary

Implement Session 12 as one self-contained scenario lab with:

- one prep script
- one homework file
- one answers file

The prep script creates the users, groups, and lab filesystem state. The homework walks the student through inspection, creation, permission repair, and ownership correction tasks using only commands already covered in the course.
