# Linux for Beginners: Session 9 Answers

## Lab: Cross-Distro Package Management Scenario

## Answer Key

### 1. Identify the package-management family of the system.

Answer:

On Debian-family systems:

- low-level package manager: `dpkg`
- higher-level package manager: `apt` or `apt-get`

On RPM-family systems:

- low-level package manager: `rpm`
- higher-level package manager: `dnf` or `yum`

Description:

In this question, you learn how to identify the package-management family of a Linux system and distinguish between the low-level package tool and the higher-level dependency-resolving frontend.

How to solve:

Run:

```bash
command -v dpkg
command -v apt
command -v rpm
command -v dnf
command -v yum
```

You can also inspect release metadata:

```bash
cat /etc/os-release
```

### 2. Find the exact installed package name for `wget`.

Answer:

On Debian-family systems:

```bash
dpkg -l wget
```

On RPM-family systems:

```bash
rpm -q wget
```

Description:

In this question, you learn how to query the installed package database and obtain the exact package identity already installed on the machine.

How to solve:

Use the command that matches the package-management family of your system. Record the exact package name, version, and architecture shown in the output.

### 3. Use the local browser package downloaded by the prep script and try to install it with the low-level package manager.

Answer:

On Debian-family systems:

```bash
sudo dpkg -i /path/to/package.deb
```

On RPM-family systems:

```bash
sudo rpm -ivh /path/to/package.rpm
```

Description:

In this question, you learn how to perform a local package installation directly with the low-level package manager.

How to solve:

Read the exact package path from:

```bash
cat "$HOME/session9-package-lab/LAB_NOTES.txt"
```

Then run the install command that matches your distro family.

### 4. Was the installation successful?

Answer:

In the prepared lab, the local install is expected to fail.

Description:

In this question, you learn that low-level package managers install local package files directly, but do not automatically resolve all missing dependencies from repositories.

How to solve:

Review the output from the install command. If the package manager reports missing dependency problems and leaves the package unconfigured or uninstalled, the installation was not successful.

### 5. If it failed, explain why it failed.

Answer:

The expected reason is unmet dependencies.

Description:

In this question, you learn how to read dependency-related failure output from package tools.

How to solve:

Look for messages that say required packages, libraries, or capabilities are missing.

Key idea:

- `dpkg` and `rpm` can install local package files directly
- they do not fully handle repository-based dependency resolution the way `apt`, `dnf`, or `yum` do

### 6. Install Firefox correctly using the higher-level package manager for your system.

Answer:

On Debian-family systems:

```bash
sudo apt install -y firefox
```

On RPM-family systems:

```bash
sudo dnf install -y firefox
```

or

```bash
sudo yum install -y firefox
```

Description:

In this question, you learn how to use the higher-level package manager to install software while automatically resolving dependencies.

How to solve:

Use the command that matches your distro family. If your system uses a different Firefox package name, use the package name shown by your search results or the lab notes.

### 7. Find the package name used to install Chromium on your distro.

Answer:

The package name depends on the distro. Common names include:

- `chromium`
- `chromium-browser`

Description:

In this question, you learn how to search package repositories by package name and description.

How to solve:

On Debian-family systems:

```bash
apt search chromium
```

On RPM-family systems:

```bash
dnf search chromium
```

or

```bash
yum search chromium
```

Read the descriptions and identify the package that matches the Chromium browser.

### 8. Find how many software repositories are currently configured on your system.

Answer:

The number depends on the machine and distro configuration.

Description:

In this question, you learn how to inspect repository configuration and count enabled or configured sources.

How to solve:

On Debian-family systems, inspect source configuration files:

```bash
grep -R '^[[:space:]]*deb ' /etc/apt/sources.list /etc/apt/sources.list.d 2>/dev/null
```

Count the active `deb` lines.

On RPM-family systems:

```bash
dnf repolist all
```

or

```bash
yum repolist all
```

Count the repositories shown in the output.

### 9. Find which package provides the `tcpdump` command.

Answer:

On Debian-family systems:

```bash
apt-file search bin/tcpdump
```

If `apt-file` is not installed:

```bash
sudo apt install -y apt-file
sudo apt-file update
apt-file search bin/tcpdump
```

On RPM-family systems:

```bash
dnf provides '*/tcpdump'
```

or

```bash
yum provides '*/tcpdump'
```

Description:

In this question, you learn how to identify which package provides a command or file path.

How to solve:

Use the correct provider query for your distro family and record the package shown for `tcpdump`.

### 10. Remove Firefox from the system.

Answer:

On Debian-family systems:

```bash
sudo apt remove -y firefox
```

On RPM-family systems:

```bash
sudo dnf remove -y firefox
```

or

```bash
sudo yum remove -y firefox
```

Description:

In this question, you learn how to remove a package cleanly using the higher-level package manager.

How to solve:

Use the removal command that matches your distro family.

Verify removal with:

On Debian-family systems:

```bash
dpkg -l | grep -i firefox
```

On RPM-family systems:

```bash
rpm -q firefox
```

### 11. Clean the package-manager cache or downloaded metadata.

Answer:

On Debian-family systems:

```bash
sudo apt clean
```

On RPM-family systems:

```bash
sudo dnf clean all
```

or

```bash
sudo yum clean all
```

Description:

In this question, you learn how to clear cached package files or repository metadata.

How to solve:

Use the cleanup command that matches your distro family.
