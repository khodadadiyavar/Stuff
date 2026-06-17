# Linux for Beginners: Session 12 Homework

## Lab: Security, Accounts, and File Permissions

## Scenario

You are helping clean up a small shared Linux training server after a rushed setup. Some accounts were created without good documentation, some shared project files have unsafe permissions, and some ownership settings do not match the intended service account layout.

Your job is to inspect the current state of the system, identify the important account and group details, and then repair the users, groups, ownership, and permissions inside the prepared lab area.

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

It also creates a notes file here:

```text
$HOME/session12-lab/LAB_NOTES.txt
```

Read that file before you start the tasks.

## Important Notes

- Some commands in this lab must be run with `sudo`.
- Work only inside `$HOME/session12-lab` unless a task explicitly asks you to inspect a system file such as `/etc/passwd`.
- Use only the commands and concepts covered so far:
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
- Verify your work as you go by checking command output carefully.

## Part 1: Accounts and Basic Security

### 1. Identify which prepared account is a standard user account.

Use the prepared accounts listed in `LAB_NOTES.txt`.

### 2. Identify which prepared account is a service-style account.

Use the account information on the system to justify your answer.

### 3. Identify the superuser account on this system.

Confirm it using a system file.

### 4. Find the UID and primary GID of `session12_chris`.

### 5. Check which groups `session12_chris` belongs to.

### 6. Use `who` to inspect the currently logged-in users.

Write down what you observe.

### 7. Use `last` to inspect recent login history.

Write down two recent entries if your system shows them.

## Part 2: Sudo and Access Control Files

### 8. Identify which file stores account metadata such as username, UID, GID, home directory, and login shell.

### 9. Identify which file stores encrypted password entries.

### 10. Identify which file stores group metadata.

### 11. Identify which file controls sudo policy.

### 12. Inspect the sudo policy and determine whether `session12_alex` has an explicit rule in `/etc/sudoers`.

If you do not find one, say so clearly.

## Part 3: Users and Groups Operations

### 13. Create a new user named `session12_sarah`.

Then set the password to:

```text
session12321
```

### 14. Create a group named `session12_john` with GID `2010`.

### 15. Create a new user named `session12_john` with all of the following:

- UID `2010`
- primary group `session12_john`
- login shell `/bin/sh`
- home directory `/home/session12_john`

After creating the user, set the password to:

```text
session12321
```

## Part 4: Permissions and Ownership

### 16. Inspect the permissions of the directory:

```text
$HOME/session12-lab/projects/sports
```

State the owner permissions, group permissions, and other permissions.

### 17. Inspect the file:

```text
$HOME/session12-lab/projects/sports/soccer
```

State its owner, group, and current permission string.

### 18. Change the file `soccer` so that group and others have only read and execute permissions.

### 19. For the same file `soccer`, add write permission back for group and remove all permissions for others.

### 20. Change the ownership of the file `soccer` so that:

- owner = `session12_service`
- group = `session12_mercury`

### 21. Change the group ownership of `report.txt` so that its group becomes `session12_sapphire`.

The file is located at:

```text
$HOME/session12-lab/projects/shared/report.txt
```

### 22. Change the ownership of the entire directory below, including everything inside it, to `session12_service:session12_mercury`.

```text
$HOME/session12-lab/projects/shared
```

### 23. Inspect the file types created directly under:

```text
$HOME/session12-lab
```

Identify:

- the symbolic link
- the named pipe

Use the first character from `ls -l` output to support your answer.

## Submission Checklist

Before you finish, confirm that:

- you ran `prepare-lab.sh`
- you reviewed `LAB_NOTES.txt`
- you inspected `/etc/passwd`, `/etc/shadow`, `/etc/group`, and `/etc/sudoers`
- you used `id`, `who`, and `last`
- you created the required users and group
- you set passwords with `passwd`
- you repaired permissions with `chmod`
- you repaired ownership with `chown` and `chgrp`
- you checked the results with `ls -l` and `ls -ld`
