# Linux for Beginners: Session 7 Homework

## Track: Debian and Ubuntu Package Management

## Objective

Practice working with:

- `dpkg`
- `apt`
- local `.deb` package installation
- dependency resolution
- package search
- package removal

## Environment Setup

Use a disposable VM or lab machine if possible. This lab installs and removes browser packages.

Make the preparation script executable and run it:

```bash
chmod +x prepare-deb-lab.sh
./prepare-deb-lab.sh
```

The script will:

- verify that you are on a Debian-based system
- refresh package metadata
- download a Firefox `.deb` package into `$HOME/session7-deb-lab`
- create a `LAB_NOTES.txt` file with the exact package path to use in the tasks

## Important Notes

- Some commands require `sudo`.
- Use the exact package path printed by the preparation script.
- Record the output you see on your own machine.
- On some distros, Firefox and Chromium package names may differ slightly. Use the package description to identify the correct one.

## Questions

### 1. Identify the package management tools available on your Debian-based system.

Find the low-level package manager and the higher-level package manager you will use in this lab.

### 2. Use the downloaded Firefox package file and try to install it with `dpkg`.

Use the file path from `$HOME/session7-deb-lab/LAB_NOTES.txt`.

### 3. Was the installation successful?

Record whether the `dpkg` installation succeeded or failed.

### 4. If it failed, explain why it failed.

Use the command output to identify the reason.

### 5. Install Firefox correctly using `apt`.

Use the package manager that resolves dependencies automatically.

### 6. Use `apt search` to locate the package used to install Chromium on your system.

Find the package whose description matches the Chromium browser.

### 7. Remove Firefox from the system.

Use the correct package-management command for a clean removal.

## Submission Checklist

Before you finish, confirm that:

- you ran `prepare-deb-lab.sh`
- you used the package file path created by the prep script
- you tested a local install with `dpkg`
- you identified the dependency-related failure correctly
- you installed Firefox with `apt`
- you located the correct Chromium package for your distro
- you removed Firefox successfully
