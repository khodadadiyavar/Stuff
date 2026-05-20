# Linux for Beginners: Session 7 Homework

## Track: RPM and YUM/DNF Package Management

## Objective

Practice working with:

- `rpm`
- `yum` or `dnf`
- local `.rpm` package installation
- dependency resolution
- package queries
- repository inspection
- package providers

## Environment Setup

Use a disposable VM or lab machine if possible. This lab installs and removes browser packages.

Make the preparation script executable and run it:

```bash
chmod +x prepare-rpm-lab.sh
./prepare-rpm-lab.sh
```

The script will:

- verify that you are on an RPM-based system
- refresh repository metadata
- prepare the download tooling if needed
- download a Firefox `.rpm` package into `$HOME/session7-rpm-lab`
- create a `LAB_NOTES.txt` file with the exact package path and package manager to use in the tasks

## Important Notes

- Some systems use `yum`, while others use `dnf`.
- On many modern RPM-based systems, `yum` may be a compatibility command backed by `dnf`.
- Some commands require `sudo`.
- Use the exact file path printed by the preparation script.
- Record the output you see on your own machine.

## Questions

### 1. Identify the package management tools available on your RPM-based system.

Find the low-level package manager and the higher-level package manager you will use in this lab.

### 2. Use an `rpm` query command and find the exact installed package name for `wget`.

Record the full package name shown on your machine.

### 3. Use the downloaded Firefox package file and try to install it with `rpm`.

Use the file path from `$HOME/session7-rpm-lab/LAB_NOTES.txt`.

### 4. Was the installation successful?

Record whether the local `rpm` installation succeeded or failed.

### 5. If it failed, explain why it failed.

Use the command output to identify the reason.

### 6. Install Firefox correctly using `yum` or `dnf`.

Use the package manager that resolves dependencies automatically on your system.

### 7. Find how many software repositories are configured on your system.

Use your higher-level package manager to inspect the repository list and count them.

### 8. Find which package provides the `tcpdump` command on your system.

Use the correct package-manager query command and record the providing package.

## Submission Checklist

Before you finish, confirm that:

- you ran `prepare-rpm-lab.sh`
- you identified the RPM-family tools on your system
- you found the exact installed package name for `wget`
- you tested a local install with `rpm`
- you identified the dependency-related failure correctly
- you installed Firefox with `yum` or `dnf`
- you counted the configured repositories
- you identified the package that provides `tcpdump`
