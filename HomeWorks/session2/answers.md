# Linux for Beginners: Session 2 Answers

## Answer Key

### 1. What is the default shell for `bob`?

Answer:

`/bin/bash`

Description:

This question checks whether the student can identify a user's default login shell.

How to solve:

Check Bob's account entry in the system user database. A common way is:

```bash
grep '^bob:' /etc/passwd
```

The last field in Bob's entry is the default shell.

### 2. Change the shell for `bob` from `bash` to Bourne Shell

Answer:

```bash
sudo chsh -s /bin/sh bob
```

Description:

This question checks whether the student can change the default shell for another user with elevated privileges.

How to solve:

Use `chsh` with `sudo` because changing another user's login shell requires administrative privileges.

```bash
sudo chsh -s /bin/sh bob
```

You can verify the change with:

```bash
grep '^bob:' /etc/passwd
```

### 3. What is the value of the environment variable `TERM`?

Answer:

`xterm-256color`

Description:

This question checks whether the student can inspect the value of an environment variable in the current shell session.

How to solve:

Print the variable:

```bash
echo "$TERM"
```

The expected value in this lab is `xterm-256color`.

### 4. Create a persistent variable

Answer:

```bash
echo 'export MY_VARIABLE="example_value"' >> ~/.profile
```

Description:

This question checks whether the student knows how to make an environment variable persist across sessions.

How to solve:

Append an `export` line to `~/.profile`, then reload the file:

```bash
echo 'export MY_VARIABLE="example_value"' >> ~/.profile
source ~/.profile
```

You can confirm it with:

```bash
echo "$MY_VARIABLE"
```

### 5. Create a new environment variable called `PROJECT`

Answer:

```bash
echo 'export PROJECT="MERCURY"' >> ~/.profile
```

Description:

This question checks whether the student can define another persistent environment variable using the same method.

How to solve:

Append the variable to `~/.profile`, then reload the profile:

```bash
echo 'export PROJECT="MERCURY"' >> ~/.profile
source ~/.profile
```

Verify it with:

```bash
echo "$PROJECT"
```

### 6. Which directory is NOT part of the `PATH` variable?

Answer:

`/opt/caleston-code`

Description:

This question checks whether the student can inspect the shell `PATH` and compare it against a given directory.

How to solve:

Print the `PATH` value:

```bash
echo "$PATH"
```

Then check whether `/opt/caleston-code` appears in the list. In this lab, it does not.

### 7. Create an alias called `up`

Answer:

```bash
echo "alias up='uptime'" >> ~/.profile
```

Description:

This question checks whether the student can create a persistent shell alias.

How to solve:

Add the alias definition to `~/.profile`, then reload it:

```bash
echo "alias up='uptime'" >> ~/.profile
source ~/.profile
```

Verify it with:

```bash
type up
up
```

### 8. Update Bob's prompt so it displays the date

Answer:

```bash
echo 'export PS1="[\d]\u@\h:\w\$ "' >> ~/.profile
```

Description:

This question checks whether the student can customize the shell prompt persistently.

How to solve:

Append the prompt definition to `~/.profile`, then reload the profile:

```bash
echo 'export PS1="[\d]\u@\h:\w\$ "' >> ~/.profile
source ~/.profile
```

After reloading, the prompt should show the date in the required format.
