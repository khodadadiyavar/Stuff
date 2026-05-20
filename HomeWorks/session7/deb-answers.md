# Linux for Beginners: Session 7 Answers

## Track: Debian and Ubuntu Package Management

## Answer Key

### 1. Identify the package management tools available on your Debian-based system.

Answer:

You should identify:

- `dpkg` as the low-level package manager
- `apt` or `apt-get` as the higher-level package manager

Description:

In this question, you learn the difference between the low-level package tool and the higher-level package-management frontend used on Debian-based systems.

How to solve:

Run:

```bash
command -v dpkg
command -v apt
command -v apt-get
```

You can also inspect package-management binaries with:

```bash
ls /usr/bin | grep -E '^(dpkg|apt|apt-get)$'
```

### 2. Use the downloaded Firefox package file and try to install it with `dpkg`.

Answer:

Use:

```bash
sudo dpkg -i /path/to/firefox-package.deb
```

Description:

In this question, you learn how to install a local `.deb` package directly with `dpkg`.

How to solve:

Read the exact file path from the lab notes:

```bash
cat "$HOME/session7-deb-lab/LAB_NOTES.txt"
```

Then run the local install command using that file path, for example:

```bash
sudo dpkg -i "$HOME/session7-deb-lab/firefox-package.deb"
```

Replace the example filename with the real one shown in `LAB_NOTES.txt`.

### 3. Was the installation successful?

Answer:

In the prepared lab, the local `dpkg` install is expected to fail.

Description:

In this question, you learn that `dpkg` installs a local package file directly, but does not automatically resolve missing dependencies.

How to solve:

Look at the output from:

```bash
sudo dpkg -i /path/to/firefox-package.deb
```

If the output ends with dependency errors and the package is left unconfigured, the installation was not successful.

### 4. If it failed, explain why it failed.

Answer:

The expected reason is unmet dependencies.

Description:

In this question, you learn how to read package-manager error output and identify dependency problems.

How to solve:

Inspect the `dpkg` output carefully. You should see messages indicating that required packages are missing or not yet installed.

The key idea is:

- `dpkg` installs the local package file
- `dpkg` does not fetch required dependencies for you

### 5. Install Firefox correctly using `apt`.

Answer:

Use:

```bash
sudo apt install -y firefox
```

If your distro uses a different package name, use the package name shown by the prep script or your package search results.

Description:

In this question, you learn how to use `apt` to install a package while resolving dependencies automatically.

How to solve:

Run:

```bash
sudo apt install -y firefox
```

If `firefox` is not the correct package name on your system, use the matching package name discovered from:

```bash
apt search firefox
```

### 6. Use `apt search` to locate the package used to install Chromium on your system.

Answer:

The correct package name depends on the distro. Common results include:

- `chromium`
- `chromium-browser`

Description:

In this question, you learn how to search the package index and use the description text to identify the right package.

How to solve:

Run:

```bash
apt search chromium
```

Read the package descriptions and choose the package whose description matches the Chromium browser on your distro.

### 7. Remove Firefox from the system.

Answer:

Use:

```bash
sudo apt remove -y firefox
```

Description:

In this question, you learn how to remove a package cleanly with `apt`.

How to solve:

Run:

```bash
sudo apt remove -y firefox
```

If your system uses a different Firefox package name, remove that package instead.

You can verify the removal with:

```bash
dpkg -l | grep -i firefox
```
