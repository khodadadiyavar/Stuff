# Linux for Beginners: Session 2 Homework

## Objective

Practice working with:

- shells
- environment variables
- `PATH`
- aliases
- profile configuration

## Environment Setup

1. Open a terminal.
2. Go to the `session2` directory.
3. Run the setup script:

```bash
bash ./setup.sh
```

The script will:

- create the lab user `bob` if needed
- prepare the required environment
- switch you automatically to user `bob`

Start the homework only after the terminal switches to `bob`.

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

Choose one:

- `/bin/zsh`
- `/bin/bash`
- `/bin/sh`
- `/bin/ksh`

### 2. Change the shell for `bob` from `bash` to Bourne Shell

Notes:

- Bob's password is `caleston123`.
- Use `sudo` for this task.
- `/bin/sh` may point to the system's POSIX shell implementation.

### 3. What is the value of the environment variable `TERM`?

Choose one:

- `terminal`
- `xterm-256color`
- `xterm`
- `xorg`
- `1`

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

Choose one:

- `/sbin`
- `/usr/bin`
- `/opt/caleston-code`
- `/bin`

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

- you ran `bash ./setup.sh`
- the script switched your terminal to `bob`
- you completed all tasks as user `bob`
- persistent changes were added to `~/.profile`
- you reloaded `~/.profile`
- the alias `up` works
- the prompt shows the date in the required format
