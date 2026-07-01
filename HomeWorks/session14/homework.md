# Linux for Beginners: Session 14 Homework

## Lab: DNS Troubleshooting and Name Resolution

## Scenario

You are helping diagnose name-resolution problems on a Linux VM used by a small team.
Some names should resolve from the local host file, while others should come from the
configured DNS server. Your job is to inspect the current DNS-related configuration,
compare command output, make controlled changes, and explain why the observed behavior
changes.

## Environment Setup

From the `session14` directory, run:

```bash
chmod +x prepare-lab.sh
./prepare-lab.sh
cat ~/session14-lab/LAB_NOTES.txt
```

## Notes

- Keep your current shell session open while you make DNS-related changes.
- Read `~/session14-lab/LAB_NOTES.txt` before editing any system file.
- Use the backup paths from `LAB_NOTES.txt` if you need to restore the original files.
- Verify the effect of each change before moving on to the next task.

## Part 1: DNS Inspection

1. Check the current hostname of the VM.
2. Identify the configured nameserver or nameservers used by this system.
3. Identify the configured search domain, if one is present.
4. Identify which file is responsible for host file-based name resolution.
5. Identify which file stores DNS resolver nameserver configuration.
6. Inspect `/etc/nsswitch.conf` and determine whether the system checks `files` before
   `dns`, or `dns` before `files`.

## Part 2: DNS Command Practice

7. Use `dig` to resolve a test domain and record the answer.
   Use `example.com` unless your instructor gave you a different name.
8. Use `nslookup` to resolve the same test domain and compare the result.
9. Explain whether the two commands agree on the answer on your system.

## Part 3: Controlled DNS Configuration Changes

10. Change the system nameserver to `8.8.8.8`.
11. Change the search domain to a new test domain of your choice and record it.
12. Change the lookup order in `/etc/nsswitch.conf` so that `dns` is checked before
    `files`.

## Part 4: Reasoning and Troubleshooting

13. After changing the lookup order, explain how host resolution behavior changes.
14. Pick one lookup result and determine whether it is coming from `/etc/hosts` or from
    DNS. Explain why.
15. Use the backup notes to describe how you would restore the original DNS-related
    files if needed.

## Submission Checklist

- You ran the prep script and reviewed `LAB_NOTES.txt`.
- You identified the hostname, nameserver, search domain, and resolver order.
- You practiced both `dig` and `nslookup`.
- You changed the nameserver, search domain, and resolver order.
- You explained the difference between `/etc/hosts` results and DNS results.
- You know how to restore the original files using the recorded backups.
