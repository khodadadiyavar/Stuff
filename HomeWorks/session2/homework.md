# Linux for Beginners: Session 2 Homework

## Objective

Practice working with:

- shells
- environment variables
- `PATH`
- aliases
- profile configuration

## Environment Setup

Run the following command in a terminal:

```bash
(command -v git >/dev/null 2>&1 || (sudo apt-get update && sudo apt-get install -y git)) && ([ -d Stuff/.git ] || git clone https://github.com/khodadadiyavar/Stuff.git) && cd Stuff/HomeWorks/session2 && chmod +x setup.sh && ./setup.sh
```

### This command assumes an Ubuntu or Debian-based Linux system with `apt-get`.

### Start the homework only after the terminal switches to `bob`.

## Important Notes

- Complete the homework as user `bob`.
- For this lab, make persistent changes in `~/.profile`.
- After editing `~/.profile`, load the changes with:

```bash
source ~/.profile
```

- When you change Bob's default shell, continue the rest of the homework in the current session. Do not restart the session unless your instructor asks you to.
- Use `sudo` when the task requires elevated privileges.

## Questions

### 1. What is the default shell for `bob`?

### 2. Change the shell for `bob` from `bash` to Bourne Shell

Notes:

- Bob's password is `caleston123`.
- Use `sudo` for this task.
- `/bin/sh` may point to the system's POSIX shell implementation.

### 3. What is the value of the environment variable `TERM`?

### 4. Create a persistent variable

Create this variable and make it persistent:

```bash
MY_VARIABLE=example_value
```

### 5. Create a new environment variable called `PROJECT`

Set it to this value and make it persistent:

```bash
PROJECT=MERCURY
```

### 6. Which of the following directories is NOT part of the `PATH` variable?

### 7. Create an alias called `up`

Make `up` run the command `uptime`, and make the alias persistent by adding it to `~/.profile`.

### 8. Update Bob's prompt so it displays the date

Required format example:

```text
[Wed Apr 22]bob@hostname:~$
```

Make sure the prompt change is persistent.

## Submission Checklist

Before you finish, confirm that:

- you ran the setup command from the Environment Setup section
- the script switched your terminal to `bob`
- you completed all tasks as user `bob`
- persistent changes were added to `~/.profile`
- you reloaded `~/.profile`
- the alias `up` works
- the prompt shows the date in the required format
