# Linux for Beginners: Session 14 Answers

## 1. Check the current hostname of the VM.

### Command

```bash
hostname
```

### What this shows

This prints the current hostname configured on the VM.

### Expected observation

You should see the hostname of your current machine.

## 2. Identify the configured nameserver or nameservers used by this system.

### Command

```bash
cat /etc/resolv.conf
```

### What this shows

This shows the resolver configuration file. Look for one or more lines that begin
with `nameserver`.

### Expected observation

You should see at least one `nameserver` line, such as:

```text
nameserver 8.8.8.8
```

## 3. Identify the configured search domain, if one is present.

### Command

```bash
cat /etc/resolv.conf
```

### What this shows

Search for a line beginning with `search`.

### Expected observation

If a search domain is configured, you should see a line such as:

```text
search example.local
```

If there is no `search` line, then no search domain is currently configured.

## 4. Identify which file is responsible for host file-based name resolution.

### Answer

The file is:

```text
/etc/hosts
```

### Why

This file stores local hostname-to-IP mappings that the system can consult during
name resolution.

## 5. Identify which file stores DNS resolver nameserver configuration.

### Answer

The file is:

```text
/etc/resolv.conf
```

### Why

This file tells the system which DNS server or servers to query.

## 6. Inspect `/etc/nsswitch.conf` and determine whether the system checks `files`
## before `dns`, or `dns` before `files`.

### Command

```bash
grep '^hosts:' /etc/nsswitch.conf
```

### What this shows

This prints the `hosts:` line, which defines the order used to resolve hostnames.

### Expected observation

You should see something like one of these:

```text
hosts: files dns
```

or

```text
hosts: dns files
```

If it says `files dns`, the host file is checked first. If it says `dns files`,
DNS is checked first.

## 7. Use `dig` to resolve a test domain and record the answer.

### Command

```bash
dig example.com
```

### What this shows

This asks the configured DNS server for records for `example.com`.

### Expected observation

In the answer section, you should see at least one IP address returned for the
domain.

## 8. Use `nslookup` to resolve the same test domain and compare the result.

### Command

```bash
nslookup example.com
```

### What this shows

This resolves the same name using another DNS tool.

### Expected observation

You should see the DNS server being used and the resolved IP address or addresses
for the domain.

## 9. Explain whether the two commands agree on the answer on your system.

### Command

```bash
dig example.com
nslookup example.com
```

### What this shows

You are comparing the resolved result from both tools.

### Expected observation

Most of the time both commands should return the same destination IP information,
even if the formatting of the output differs.

## 10. Change the system nameserver to `8.8.8.8`.

### Action

Edit `/etc/resolv.conf` and set:

```text
nameserver 8.8.8.8
```

### One simple way

```bash
sudo vi /etc/resolv.conf
```

### Verification

```bash
cat /etc/resolv.conf
```

### Expected observation

You should now see:

```text
nameserver 8.8.8.8
```

## 11. Change the search domain to a new test domain of your choice and record it.

### Action

Add or update a `search` line in `/etc/resolv.conf`.

### Example

```text
search training.local
```

### One simple way

```bash
sudo vi /etc/resolv.conf
```

### Verification

```bash
cat /etc/resolv.conf
```

### Expected observation

You should see your chosen `search` line in the resolver configuration.

## 12. Change the lookup order in `/etc/nsswitch.conf` so that `dns` is checked
## before `files`.

### Action

Edit the `hosts:` line so it becomes:

```text
hosts: dns files
```

### One simple way

```bash
sudo vi /etc/nsswitch.conf
```

### Verification

```bash
grep '^hosts:' /etc/nsswitch.conf
```

### Expected observation

You should now see:

```text
hosts: dns files
```

## 13. After changing the lookup order, explain how host resolution behavior changes.

### Explanation

When `dns` is placed before `files`, the system tries DNS before checking
`/etc/hosts`. When `files` is first, the local host file can override DNS results.

### How to confirm

```bash
grep '^hosts:' /etc/nsswitch.conf
cat /etc/hosts
```

Compare the resolver order to the names you expect to resolve locally.

## 14. Pick one lookup result and determine whether it is coming from `/etc/hosts`
## or from DNS. Explain why.

### Suggested method

1. Inspect the local host file:

```bash
cat /etc/hosts
```

2. Check the resolver order:

```bash
grep '^hosts:' /etc/nsswitch.conf
```

3. Resolve the name:

```bash
nslookup example.com
```

or

```bash
dig example.com
```

### Explanation

If the name appears in `/etc/hosts` and `files` is checked first, the result can come
from the host file. If the name is not in `/etc/hosts`, or if `dns` is checked first,
the answer is more likely to come from DNS.

## 15. Use the backup notes to describe how you would restore the original
## DNS-related files if needed.

### Command

```bash
cat ~/session14-lab/LAB_NOTES.txt
```

### What this shows

The lab notes include backup file paths and rollback examples.

### Rollback commands

```bash
sudo cp ~/session14-lab/hosts.backup /etc/hosts
sudo cp ~/session14-lab/resolv.conf.backup /etc/resolv.conf
sudo cp ~/session14-lab/nsswitch.conf.backup /etc/nsswitch.conf
```

### Why this matters

These commands let you restore the original DNS-related files if your edits break
name resolution.
