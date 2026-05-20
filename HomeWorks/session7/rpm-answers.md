# Linux for Beginners: Session 7 Answers

## Track: RPM and YUM/DNF Package Management

## Answer Key

### 1. Identify the package management tools available on your RPM-based system.

Answer:

You should identify:

- `rpm` as the low-level package manager
- `yum` or `dnf` as the higher-level package manager

Description:

In this question, you learn the difference between the low-level package tool and the higher-level package-management frontend used on RPM-based systems.

How to solve:

Run:

```bash
command -v rpm
command -v yum
command -v dnf
```

Use whichever higher-level tool is present on your system.

### 2. Use an `rpm` query command and find the exact installed package name for `wget`.

Answer:

Use:

```bash
rpm -q wget
```

Description:

In this question, you learn how to query the RPM database for the exact installed package name of a program.

How to solve:

Run:

```bash
rpm -q wget
```

This prints the full installed package name, including version and architecture, if `wget` is installed.

### 3. Use the downloaded Firefox package file and try to install it with `rpm`.

Answer:

Use:

```bash
sudo rpm -ivh /path/to/firefox-package.rpm
```

Description:

In this question, you learn how to install a local `.rpm` package directly with `rpm`.

How to solve:

Read the exact file path from:

```bash
cat "$HOME/session7-rpm-lab/LAB_NOTES.txt"
```

Then run the local install command using that file path, for example:

```bash
sudo rpm -ivh "$HOME/session7-rpm-lab/firefox-package.rpm"
```

Replace the example filename with the real one shown in `LAB_NOTES.txt`.

### 4. Was the installation successful?

Answer:

In the prepared lab, the local `rpm` install is expected to fail.

Description:

In this question, you learn that `rpm` installs a local package file directly, but does not automatically resolve missing dependencies.

How to solve:

Look at the output from:

```bash
sudo rpm -ivh /path/to/firefox-package.rpm
```

If the output reports missing requirements and the installation stops, then the installation was not successful.

### 5. If it failed, explain why it failed.

Answer:

The expected reason is unmet dependencies.

Description:

In this question, you learn how to read RPM error output and recognize dependency problems.

How to solve:

Inspect the output from the local `rpm` install. You should see missing dependency messages.

The key idea is:

- `rpm` installs a local package file
- `rpm` does not automatically fetch and install missing dependencies for you

### 6. Install Firefox correctly using `yum` or `dnf`.

Answer:

Use one of these, depending on your system:

```bash
sudo yum install -y firefox
```

or

```bash
sudo dnf install -y firefox
```

Description:

In this question, you learn how to use the higher-level package manager to install a package with automatic dependency resolution.

How to solve:

Run the command that matches the package manager available on your system:

```bash
sudo yum install -y firefox
```

or

```bash
sudo dnf install -y firefox
```

### 7. Find how many software repositories are configured on your system.

Answer:

The number depends on the system.

Description:

In this question, you learn how to inspect repository configuration on an RPM-based system.

How to solve:

Run:

```bash
yum repolist all
```

or

```bash
dnf repolist all
```

Count the repository entries shown in the output.

### 8. Find which package provides the `tcpdump` command on your system.

Answer:

Use:

```bash
yum provides '*/tcpdump'
```

or

```bash
dnf provides '*/tcpdump'
```

Description:

In this question, you learn how to find which package provides a specific command or file.

How to solve:

Run the command that matches your system:

```bash
yum provides '*/tcpdump'
```

or

```bash
dnf provides '*/tcpdump'
```

Read the output and record the package that provides the `tcpdump` command.
