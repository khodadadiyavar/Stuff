# Linux for Beginners: Session 13 Homework

## Lab: SSH Hardening, Access Review, and Secure File Transfer

## Scenario

You are helping secure a Linux VM that is about to be used for remote administration and file transfer.
The VM already exists and you are working on the real machine, not a fake sandbox.

Before you change SSH behavior, you must review the prepared users, groups, and sudo access that were set up for this lab. Then you will configure passwordless SSH for the correct admin account, restrict access for the wrong account, harden root SSH access, validate the configuration, and finally transfer a file with `scp`.

## Environment Setup

From the `session13` directory:

```bash
chmod +x prepare-lab.sh
./prepare-lab.sh
cat ~/session13-lab/LAB_NOTES.txt
```

## Important Notes

- Use `sudo` when a task requires system-level access.
- Keep your current shell session open while you test SSH changes.
- Do not overwrite the SSH configuration blindly. Review it first.
- Use the backup path in `~/session13-lab/LAB_NOTES.txt` if you need to roll back.
- When editing the SSH configuration, update an existing directive if it is already present instead of adding the same directive many times.

## Tasks

### 1. Review the prepared lab state

Read `~/session13-lab/LAB_NOTES.txt` and identify:

- the prepared SSH admin user
- the prepared restricted user
- the prepared SSH admin group

### 2. Review the prepared admin account

Use `id` on the prepared SSH admin user and record:

- the UID
- the primary group
- the supplementary groups

### 3. Review access-control files

Identify which file stores encrypted passwords for local users, then inspect the entry for the prepared SSH admin user.

### 4. Review sudo access

Inspect `/etc/sudoers` and the lab sudoers drop-in file created by the prep script.

What level of sudo access does the prepared SSH admin group have?

### 5. Review SSH basics

What default port does the SSH service use?

### 6. Review how SSH chooses the remote user

If you run `ssh localhost` without specifying a username, which account name will SSH try to use by default?

### 7. Inspect the live SSH daemon configuration

Inspect `/etc/ssh/sshd_config` and find the current state of these directives:

- `PermitRootLogin`
- `PasswordAuthentication`
- `PubkeyAuthentication`
- `AllowUsers`
- `AllowGroups`

### 8. Identify the key files prepared for this lab

Use the lab notes to identify:

- the private key path
- the public key path

### 9. Configure passwordless SSH for the prepared admin user

Use `ssh-copy-id` to copy the prepared public key to the prepared SSH admin user on `localhost`.

### 10. Review and fix SSH key file permissions

Inspect the `.ssh` directory and the `authorized_keys` file for the prepared SSH admin user.

If needed, fix them so that:

- the `.ssh` directory is only accessible by the owner
- the `authorized_keys` file is only readable and writable by the owner

### 11. Add a user-based SSH allow rule

Edit `/etc/ssh/sshd_config` so that SSH allows:

- your current VM user
- the prepared SSH admin user

Use `AllowUsers`.

### 12. Replace the user-based rule with a group-based rule

Now remove or replace the `AllowUsers` rule and use `AllowGroups` instead.

Only the prepared SSH admin group should be allowed.

After you make the change, explain why the prepared restricted user will not be allowed to log in over SSH.

### 13. Harden root SSH access

Edit the SSH daemon configuration and disable direct root SSH login.

### 14. Harden password-based SSH access

After key-based access is ready for the prepared SSH admin user, disable password-based SSH authentication.

### 15. Validate and reload the SSH service safely

Validate the SSH daemon configuration before reloading or restarting the service.

Then reload or restart the SSH service on your VM.

### 16. Transfer a file with SCP

Use `scp` to copy the lab payload file from your current account to the home directory of the prepared SSH admin user on `localhost`.

If needed, use the prepared private key from the lab notes.

### 17. Verify the final state

Verify all of the following:

- the prepared admin user can use key-based SSH access
- the prepared restricted user is not part of the allowed SSH admin group
- the SCP payload file exists in the prepared admin user’s home directory

## Submission Checklist

Before you consider the lab complete, make sure you can confirm all of the following:

- `~/session13-lab/LAB_NOTES.txt` exists and you used it during the lab
- the prepared public key was copied to the target account
- `AllowUsers` was tested and then replaced with `AllowGroups`
- root SSH login is disabled
- password-based SSH login is disabled only after key-based login was prepared
- the SSH configuration was validated before the service was reloaded or restarted
- the SCP payload file was copied to the prepared admin user’s home directory
