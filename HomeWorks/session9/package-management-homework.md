# Linux for Beginners: Session 9 Homework

## Lab: Cross-Distro Package Management Scenario

## Scenario

You have joined the operations team and inherited a Linux workstation with incomplete package-management notes. Your task is to investigate the system, identify the package-management stack in use, validate package sources, recover from a failed local package install, and clean up after a test browser deployment.

This lab is written to work on both:

- Debian and Ubuntu based systems
- RHEL, Rocky, AlmaLinux, Fedora, and CentOS style systems

## Environment Setup

Make the preparation script executable and run it:

```bash
chmod +x prepare-package-lab.sh
./prepare-package-lab.sh
```

The preparation script will:

- detect whether the system is Debian-family or RPM-family
- refresh package metadata
- download a local browser package into a lab directory in your home folder
- create a `LAB_NOTES.txt` file with the exact package path and distro-specific hints

## Important Notes

- Use the exact package path written to `LAB_NOTES.txt`.
- Some commands require `sudo`.
- Record the real output shown by your own machine.
- If your distro uses a slightly different browser package name, use the correct package shown by your package search results.

## Questions

### 1. Identify the package-management family of the system.

Determine whether the system is Debian-family or RPM-family, and identify:

- the low-level package manager
- the higher-level package manager

### 2. Find the exact installed package name for `wget`.

Record the full installed package name shown on your system.

### 3. Use the local browser package downloaded by the prep script and try to install it with the low-level package manager.

Use the exact package path from `LAB_NOTES.txt`.

### 4. Was the installation successful?

Record whether the local install succeeded or failed.

### 5. If it failed, explain why it failed.

Use the command output to identify the reason.

### 6. Install Firefox correctly using the higher-level package manager for your system.

Use the correct distro-specific command that resolves dependencies automatically.

### 7. Find the package name used to install Chromium on your distro.

Use the package search functionality available on your system and record the correct package name.

### 8. Find how many software repositories are currently configured on your system.

Use the package-management tools available on your distro and count the configured repositories.

### 9. Find which package provides the `tcpdump` command.

Use the correct package-management query for your distro and record the package that provides it.

### 10. Remove Firefox from the system.

Use the correct package-management command for your distro and verify that the package is no longer installed.

### 11. Clean the package-manager cache or downloaded metadata.

Use the appropriate cleanup command for your distro.

## Submission Checklist

Before you finish, confirm that:

- you ran `prepare-package-lab.sh`
- you identified the package-management family correctly
- you used the local package path from `LAB_NOTES.txt`
- you tested a local install with the low-level package manager
- you explained the failed local install correctly
- you installed and later removed Firefox with the higher-level package manager
- you found the Chromium package name for your distro
- you counted configured repositories
- you identified the package that provides `tcpdump`
- you ran a package-cache cleanup command
