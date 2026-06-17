# Linux for Beginners: Session 12 Answers

## Lab: Security, Accounts, and File Permissions

## Answer Key

### 1. Identify the prepared standard user account that uses `/bin/bash` as its login shell.

Answer:

Use:

```bash
grep '^session12_alex:' /etc/passwd
```

Description:

In this question, you learn how to identify a regular user account by checking `/etc/passwd` and reading the account entry.

How to solve:

Run:

```bash
grep '^session12_alex:' /etc/passwd
```

You should see an entry for `session12_alex` with a normal home directory and the login shell `/bin/bash`. `session12_chris` is also a standard user, but this question is asking for the prepared standard user that uses `/bin/bash`, which is `session12_alex`.

### 2. Identify which prepared account is a service-style account.

Answer:

Use:

```bash
grep '^session12_service:' /etc/passwd
```

Description:

In this question, you learn how service-style accounts usually look in `/etc/passwd`.

How to solve:

Run:

```bash
grep '^session12_service:' /etc/passwd
```

Look at the shell and home fields. A non-login shell such as `/usr/sbin/nologin` and a non-interactive home path show that `session12_service` is the prepared service-style account.

### 3. Identify the superuser account on this system.

Answer:

Use:

```bash
grep '^root:' /etc/passwd
```

Description:

In this question, you learn how to confirm the superuser account directly from the system account file.

How to solve:

Run:

```bash
grep '^root:' /etc/passwd
```

The `root` account is the superuser account. It has UID `0`.

### 4. Find the UID and primary GID of `session12_chris`.

Answer:

Use:

```bash
id session12_chris
```

Description:

In this question, you learn how to read a user’s UID and primary GID from the `id` command.

How to solve:

Run:

```bash
id session12_chris
```

You should see `uid=2012(session12_chris)` and a numeric `gid=` value for the primary group. Identify that numeric `gid=` value first, then match it to the primary group name `session12_cannon`.

### 5. Check which groups `session12_chris` belongs to.

Answer:

Use:

```bash
id session12_chris
```

Description:

In this question, you learn how to inspect both the primary group and supplemental groups for a user.

How to solve:

Run:

```bash
id session12_chris
```

The output should show `session12_cannon` as the primary group and `session12_mercury` plus `session12_sapphire` as additional groups.

### 6. Use `who` to inspect the currently logged-in users.

Answer:

Use:

```bash
who
```

Description:

In this question, you learn how to see who is currently logged in to the system.

How to solve:

Run:

```bash
who
```

Record whatever the command shows on your system. This answer depends on the machine you are using at the time.

### 7. Use `last` to inspect recent login history.

Answer:

Use:

```bash
last
```

Description:

In this question, you learn how to inspect recent login history from the system records.

How to solve:

Run:

```bash
last
```

Write down two recent entries if your system displays them. The exact output depends on the machine.

### 8. Identify which file stores account metadata such as username, UID, GID, home directory, and login shell.

Answer:

Use:

```bash
cat /etc/passwd
```

Description:

In this question, you learn which file stores basic account metadata.

How to solve:

Run:

```bash
cat /etc/passwd
```

The correct file is `/etc/passwd`.

### 9. Identify which file stores encrypted password entries.

Answer:

Use:

```bash
sudo cat /etc/shadow
```

Description:

In this question, you learn where encrypted password entries are stored.

How to solve:

Run:

```bash
sudo cat /etc/shadow
```

The correct file is `/etc/shadow`.

### 10. Identify which file stores group metadata.

Answer:

Use:

```bash
cat /etc/group
```

Description:

In this question, you learn which file stores group names, GIDs, and group members.

How to solve:

Run:

```bash
cat /etc/group
```

The correct file is `/etc/group`.

### 11. Identify which file controls sudo policy.

Answer:

Use:

```bash
sudo cat /etc/sudoers
```

Description:

In this question, you learn which file defines sudo policy on the system.

How to solve:

Run:

```bash
sudo cat /etc/sudoers
```

The main sudo policy file is `/etc/sudoers`.

### 12. Inspect the sudo policy and determine whether `session12_alex` has an explicit rule in `/etc/sudoers`.

Answer:

Use:

```bash
sudo grep 'session12_alex' /etc/sudoers
```

Description:

In this question, you learn how to search the sudo policy for a specific user entry.

How to solve:

Run:

```bash
sudo grep 'session12_alex' /etc/sudoers
```

If the command prints nothing, then `session12_alex` does not have an explicit rule in `/etc/sudoers`.

### 13. Create a new user named `session12_sarah`.

Answer:

Use:

```bash
sudo useradd session12_sarah
sudo passwd session12_sarah
```

Description:

In this question, you learn how to create a new user and then assign a password.

How to solve:

Run:

```bash
sudo useradd session12_sarah
sudo passwd session12_sarah
```

When `passwd` prompts you, enter:

```text
session12321
```

and then enter it again to confirm.

### 14. Create a group named `session12_john` with GID `2010`.

Answer:

Use:

```bash
sudo groupadd -g 2010 session12_john
```

Description:

In this question, you learn how to create a group with a specific GID.

How to solve:

Run:

```bash
sudo groupadd -g 2010 session12_john
```

This creates the group with the required numeric group ID.

### 15. Create a new user named `session12_john` with UID `2010`, primary group `session12_john`, login shell `/bin/sh`, and home directory `/home/session12_john`.

Answer:

Use:

```bash
sudo useradd -m -u 2010 -g session12_john -d /home/session12_john -s /bin/sh session12_john
sudo passwd session12_john
```

Description:

In this question, you learn how to create a user with a specific UID, primary group, home directory, and login shell.

How to solve:

Run:

```bash
sudo useradd -m -u 2010 -g session12_john -d /home/session12_john -s /bin/sh session12_john
sudo passwd session12_john
```

When `passwd` prompts you, enter:

```text
session12321
```

and confirm it.

### 16. Inspect the permissions of the directory `$HOME/session12-lab/projects/sports`.

Answer:

Use:

```bash
ls -ld "$HOME/session12-lab/projects/sports"
```

Description:

In this question, you learn how to inspect a directory’s permission string without listing its contents.

How to solve:

Run:

```bash
ls -ld "$HOME/session12-lab/projects/sports"
```

Read the owner, group, and other permission bits from the output. The prepared state is `750`, which means:

- owner: `rwx`
- group: `r-x`
- others: `---`

### 17. Inspect the file `soccer`.

Answer:

Use:

```bash
ls -l "$HOME/session12-lab/projects/sports/soccer"
```

Description:

In this question, you learn how to inspect a file’s owner, group, and permission string.

How to solve:

Run:

```bash
ls -l "$HOME/session12-lab/projects/sports/soccer"
```

In the prepared state, the owner is `session12_alex`, the group is `session12_mercury`, and the permission string is `-rwxrwxrwx`.

### 18. Change the file `soccer` so that group and others have only read and execute permissions.

Answer:

Use:

```bash
sudo chmod go=rx "$HOME/session12-lab/projects/sports/soccer"
```

Description:

In this question, you learn how to change permissions with symbolic mode for group and others.

How to solve:

Run:

```bash
sudo chmod go=rx "$HOME/session12-lab/projects/sports/soccer"
```

This sets both group and others to exactly `r-x`.

### 19. For the same file `soccer`, add write permission back for group and remove all permissions for others.

Answer:

Use:

```bash
sudo chmod g+w,o-rwx "$HOME/session12-lab/projects/sports/soccer"
```

Description:

In this question, you learn how to combine symbolic permission changes in one command.

How to solve:

Run:

```bash
sudo chmod g+w,o-rwx "$HOME/session12-lab/projects/sports/soccer"
```

After this change, the group regains write permission and others lose all permissions.

### 20. Change the ownership of the file `soccer` so that owner = `session12_service` and group = `session12_mercury`.

Answer:

Use:

```bash
sudo chown session12_service:session12_mercury "$HOME/session12-lab/projects/sports/soccer"
```

Description:

In this question, you learn how to change both owner and group with one `chown` command.

How to solve:

Run:

```bash
sudo chown session12_service:session12_mercury "$HOME/session12-lab/projects/sports/soccer"
```

Then verify with `ls -l`.

### 21. Change the group ownership of `report.txt` so that its group becomes `session12_sapphire`.

Answer:

Use:

```bash
sudo chgrp session12_sapphire "$HOME/session12-lab/projects/shared/report.txt"
```

Description:

In this question, you learn how to change only the group ownership of a file.

How to solve:

Run:

```bash
sudo chgrp session12_sapphire "$HOME/session12-lab/projects/shared/report.txt"
```

Then verify the group with `ls -l`.

### 22. Change the ownership of the entire `shared` directory, including everything inside it, to `session12_service:session12_mercury`.

Answer:

Use:

```bash
sudo chown -R session12_service:session12_mercury "$HOME/session12-lab/projects/shared"
```

Description:

In this question, you learn how to fix ownership recursively for a directory tree.

How to solve:

Run:

```bash
sudo chown -R session12_service:session12_mercury "$HOME/session12-lab/projects/shared"
```

Use `ls -ld` on the directory and `ls -l` on the files inside it to verify the result.

### 23. Inspect the file types created directly under `$HOME/session12-lab`.

Answer:

Use:

```bash
ls -l "$HOME/session12-lab"
```

Description:

In this question, you learn how to identify special file types from the first character in long-listing output.

How to solve:

Run:

```bash
ls -l "$HOME/session12-lab"
```

Look for:

- `l` at the beginning of the symbolic link entry
- `p` at the beginning of the named pipe entry

The symbolic link is `report-link`, and the named pipe is `lab-pipe`.
