# Linux for Beginners: Session 13 Answers

## Session 13: SSH Hardening, Access Review, and Secure File Transfer

This answer key explains one direct way to complete each task in the lab.

Keep in mind that some values, such as UIDs or existing SSH settings, may differ from one VM to another.
When that happens, your job is to inspect the real result on your own machine.

## 1. Review the prepared lab state

### What you are learning

In this question, you learn how to read the lab notes and identify the prepared usernames, group names, and paths before you start changing the system.

### Command

```bash
cat ~/session13-lab/LAB_NOTES.txt
```

### What to observe

You should see these prepared lab objects:

- `session13_admin`
- `session13_guest`
- `session13_sshadmins`

## 2. Review the prepared admin account

### What you are learning

In this question, you learn how to inspect a user account and read its UID, primary group, and supplementary groups with `id`.

### Command

```bash
id session13_admin
```

### What to observe

You should see:

- the numeric `uid=...`
- the primary `gid=...`
- a `groups=...` section that includes `session13_sshadmins`

## 3. Review access-control files

### What you are learning

In this question, you review which access-control file stores encrypted passwords and how to inspect a single user entry.

### Commands

```bash
sudo grep '^session13_admin:' /etc/shadow
```

### What to observe

The file with encrypted passwords is:

```text
/etc/shadow
```

The output line for `session13_admin` should begin with:

```text
session13_admin:
```

## 4. Review sudo access

### What you are learning

In this question, you review where sudo access is defined and how a group can be granted administrative access.

### Commands

```bash
sudo cat /etc/sudoers
sudo cat /etc/sudoers.d/session13_sshadmins
```

### What to observe

You should see a line like this in the drop-in file:

```text
%session13_sshadmins ALL=(ALL:ALL) ALL
```

That means members of `session13_sshadmins` have full sudo access.

## 5. Review SSH basics

### What you are learning

In this question, you review the default network port used by SSH.

### Answer

The default SSH port is:

```text
22
```

## 6. Review how SSH chooses the remote user

### What you are learning

In this question, you learn that SSH uses your current local username by default when you do not specify `user@host`.

### Commands

```bash
id
```

If you want to test it:

```bash
ssh localhost
```

### What to observe

When you run `ssh localhost` without a username, SSH tries to use your current local account name.

If your current account is `michael`, SSH will try `michael@localhost`.

## 7. Inspect the live SSH daemon configuration

### What you are learning

In this question, you learn how to inspect the live SSH daemon configuration and search for important hardening directives.

### Commands

```bash
sudo grep '^PermitRootLogin' /etc/ssh/sshd_config
sudo grep '^PasswordAuthentication' /etc/ssh/sshd_config
sudo grep '^PubkeyAuthentication' /etc/ssh/sshd_config
sudo grep '^AllowUsers' /etc/ssh/sshd_config
sudo grep '^AllowGroups' /etc/ssh/sshd_config
```

### What to observe

You should record the live state on your VM.

Some directives may already exist.
Some may return no output, which means you will need to add them later.

## 8. Identify the key files prepared for this lab

### What you are learning

In this question, you learn how to distinguish the private key from the public key.

### Command

```bash
cat ~/session13-lab/LAB_NOTES.txt
```

### What to observe

The prepared key files are:

- private key: `~/session13-lab/session13_id_rsa`
- public key: `~/session13-lab/session13_id_rsa.pub`

The `.pub` file is the public key.

## 9. Configure passwordless SSH for the prepared admin user

### What you are learning

In this question, you learn how to install a public key on the target account with `ssh-copy-id`.

### Command

```bash
ssh-copy-id -i ~/session13-lab/session13_id_rsa.pub session13_admin@localhost
```

### What to observe

You should be prompted for the password of `session13_admin`.
After that, the public key should be added to that account’s `authorized_keys` file.

## 10. Review and fix SSH key file permissions

### What you are learning

In this question, you learn the correct ownership and permission model for SSH key authentication files.

### Commands

```bash
sudo ls -ld /home/session13_admin/.ssh
sudo ls -l /home/session13_admin/.ssh/authorized_keys
sudo chown -R session13_admin:session13_admin /home/session13_admin/.ssh
sudo chmod 700 /home/session13_admin/.ssh
sudo chmod 600 /home/session13_admin/.ssh/authorized_keys
```

### What to observe

The final state should be:

- `.ssh` owned by `session13_admin`
- `.ssh` permission `700`
- `authorized_keys` owned by `session13_admin`
- `authorized_keys` permission `600`

## 11. Add a user-based SSH allow rule

### What you are learning

In this question, you learn how to allow only specific usernames with `AllowUsers`.

### Action

Open the SSH daemon configuration with the editor you already learned:

```bash
sudo vi /etc/ssh/sshd_config
```

Add or update these lines:

```text
PubkeyAuthentication yes
AllowUsers YOUR_CURRENT_USER session13_admin
```

### What to observe

Replace `YOUR_CURRENT_USER` with the user you are currently logged in as.
This step keeps your own SSH access available while also allowing `session13_admin`.

## 12. Replace the user-based rule with a group-based rule

### What you are learning

In this question, you learn how to switch from a direct user allowlist to a group-based SSH access model.

### Action

Edit the same configuration file:

```bash
sudo vi /etc/ssh/sshd_config
```

Remove or comment the `AllowUsers` line and add:

```text
AllowGroups session13_sshadmins
```

### What to observe

`session13_guest` will be blocked because that user is not a member of `session13_sshadmins`.

You can confirm the memberships with:

```bash
id session13_admin
id session13_guest
```

## 13. Harden root SSH access

### What you are learning

In this question, you learn how to stop direct root SSH logins.

### Action

Edit the SSH configuration:

```bash
sudo vi /etc/ssh/sshd_config
```

Add or update this line:

```text
PermitRootLogin no
```

### What to observe

This change disables direct root login over SSH, which is a common hardening step.

## 14. Harden password-based SSH access

### What you are learning

In this question, you learn how to require stronger key-based access by disabling SSH password authentication.

### Action

Edit the SSH configuration:

```bash
sudo vi /etc/ssh/sshd_config
```

Add or update this line:

```text
PasswordAuthentication no
```

### What to observe

Only do this after key-based login works for `session13_admin`.
Otherwise, you can lock yourself out of future SSH logins.

## 15. Validate and reload the SSH service safely

### What you are learning

In this question, you learn how to test the SSH daemon configuration before applying it and then reload or restart the service.

### Commands

Validate the configuration first:

```bash
sudo sshd -t
```

Then reload or restart the service.
Use the unit name your VM provides:

```bash
sudo systemctl restart ssh
```

or

```bash
sudo systemctl restart sshd
```

### What to observe

`sudo sshd -t` should return no output if the configuration is valid.

Keep your current shell open while doing this.
If you make a mistake, restore the backup recorded in `~/session13-lab/LAB_NOTES.txt`.

## 16. Transfer a file with SCP

### What you are learning

In this question, you learn how to copy a file securely over SSH.

### Command

```bash
scp -i ~/session13-lab/session13_id_rsa ~/session13-lab/scp-payload.txt session13_admin@localhost:/home/session13_admin/
```

### What to observe

The file should be copied into `/home/session13_admin/` on the target side.

## 17. Verify the final state

### What you are learning

In this question, you confirm that the hardened SSH workflow works as intended.

### Commands

Verify the admin user can log in with the key:

```bash
ssh -i ~/session13-lab/session13_id_rsa session13_admin@localhost
```

After you log in, verify the copied file:

```bash
ls -l /home/session13_admin/scp-payload.txt
```

Back on your original shell, confirm the guest user is not in the allowed group:

```bash
id session13_guest
```

### What to observe

You should confirm all three things:

- `session13_admin` can log in with the prepared key
- `session13_guest` is not in `session13_sshadmins`
- `scp-payload.txt` exists in `/home/session13_admin/`

## Rollback Reminder

If you need to restore the SSH configuration, use the backup path stored in:

```bash
cat ~/session13-lab/LAB_NOTES.txt
```

Then copy the saved backup back into place and restart the SSH service.
