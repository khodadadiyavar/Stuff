# Session 14 DNS Lab Design

## Objective

Create a single scenario-based Session 14 lab that teaches:

- DNS basics and name resolution behavior
- `hostname`
- `dig`
- `nslookup`
- `/etc/hosts`
- `/etc/resolv.conf`
- `/etc/nsswitch.conf`
- basic resolver-order behavior
- search domains
- safe inspection and modification of DNS-related configuration files

The lab must stay within commands and concepts already taught in earlier sessions, plus the DNS tools and configuration topics introduced in this session.

## Deliverables

The implementation will add:

- `session14/homework.md`
- `session14/answers.md`
- `session14/prepare-lab.sh`

## Scenario

The student is helping diagnose and fix name-resolution problems on a Linux VM. Some lookups should resolve from the local host file, others should come from DNS, and a few results depend on the resolver search order and search domain configuration. The student must inspect the current DNS-related configuration, compare command outputs, make controlled changes, and explain why the observed behavior changes.

## Constraints

- The lab must work on the student’s real VM.
- The prep script must not blindly overwrite the live system configuration.
- The homework must instruct the student to back up and preserve a rollback path for the edited files.
- The prep script should create helper notes and lab-specific test names, but the student should perform the actual edits during the lab.
- Keep the lab self-contained and reproducible where possible.
- Do not use KodeKloud names or branding.

## Allowed Command and Concept Set

The answer key may use:

- `hostname`
- `cat`
- `grep`
- `sudo`
- `dig`
- `nslookup`

The homework may also require direct editing of:

- `/etc/hosts`
- `/etc/resolv.conf`
- `/etc/nsswitch.conf`

No extra diagnostic tools beyond the covered set should be introduced.

## Lab Structure

The lab will be one continuous homework file with the following parts:

1. DNS inspection
2. DNS command practice
3. Controlled DNS configuration changes
4. Reasoning about name-resolution behavior

## Preparation Script Design

`prepare-lab.sh` will:

- create `$HOME/session14-lab`
- create `LAB_NOTES.txt`
- create backup copies of:
  - `/etc/hosts`
  - `/etc/resolv.conf`
  - `/etc/nsswitch.conf`
- record the backup paths and rollback notes in `LAB_NOTES.txt`
- append or create lab-safe notes with example test names and expected investigation targets
- avoid modifying the live DNS-related configuration automatically

Suggested lab assets:

- `$HOME/session14-lab/LAB_NOTES.txt`
- `$HOME/session14-lab/hosts.backup`
- `$HOME/session14-lab/resolv.conf.backup`
- `$HOME/session14-lab/nsswitch.conf.backup`

## Homework Content Plan

### Part 1: DNS Inspection

Tasks in this section will cover:

- checking the current hostname
- identifying the configured nameserver(s)
- identifying the configured search domain
- identifying which file controls host-file lookups
- identifying which file controls resolver nameserver configuration
- identifying the current lookup order from `/etc/nsswitch.conf`

### Part 2: DNS Command Practice

Tasks in this section will cover:

- resolving a domain with `dig`
- resolving a domain with `nslookup`
- comparing the output of the two commands
- understanding when local host-file entries affect name resolution and when they do not

### Part 3: Controlled DNS Configuration Changes

Tasks in this section will cover:

- changing the nameserver to a specified IP
- changing the search domain
- changing lookup order in `/etc/nsswitch.conf`
- verifying each change after it is made

### Part 4: Reasoning and Troubleshooting

Tasks in this section will cover:

- determining whether a result came from `/etc/hosts` or DNS
- explaining why a short hostname resolves differently from a fully qualified domain name
- explaining why changing the resolver order changes the observed lookup result
- using the backup/rollback notes if a configuration needs to be restored

## Difficulty and Progression

The lab should begin with simple file inspection and direct command usage, then progress into real configuration changes, and finally require explanation of why the observed behavior changed.

Target length:

- approximately 10 to 14 questions

## Answers File Design

`answers.md` will include for each question:

- the expected command or command pattern
- a short explanation addressed directly to the student
- the expected observation or behavior

The answer key must not introduce tools beyond the approved command set.

## Verification Strategy

The homework will direct the student to verify results with:

- `hostname`
- `cat`
- `grep`
- `dig`
- `nslookup`

The student should run the same commands before and after configuration changes so the effect of each edit is visible.

## Risks and Mitigations

### Risk: Student breaks DNS resolution on the VM

Mitigation:

- prep script records backup paths and rollback instructions
- homework explicitly tells the student to inspect and back up before changing anything
- changes are limited to a few known config files

### Risk: Output differs between student VMs

Mitigation:

- design the questions so the student must inspect their own system
- use observation-based answers where exact values may differ
- keep the answer key focused on method and interpretation

### Risk: The lab becomes too abstract

Mitigation:

- require real edits to `/etc/hosts`, `/etc/resolv.conf`, and `/etc/nsswitch.conf`
- require comparison of results before and after each change

## Implementation Plan Summary

Implement Session 14 as one real-system DNS troubleshooting and configuration lab with:

- one prep script
- one homework file
- one answers file

The prep script prepares notes and backups, while the student performs the real inspection, command use, configuration changes, and reasoning steps on the VM itself.
