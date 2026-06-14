# Linux for Beginners: Session 11 Homework

## Lab: Editing, Searching, and Redirecting in a Support Scenario

## Scenario

You are helping another administrator clean up a small Linux training lab. Some files were created in the wrong place, some text must be edited with `vi`, and some command output must be captured into files for documentation.

Your job is to work inside a prepared lab directory, inspect the files, edit the right ones, search for data, and save your findings.

## Environment Setup

Make the preparation script executable and run it:

```bash
chmod +x prepare-lab.sh
./prepare-lab.sh
```

The script will create a practice lab under:

```text
$HOME/session11-lab
```

## Important Notes

- Work only inside `$HOME/session11-lab` unless a task explicitly says otherwise.
- Some systems may require `sudo` for `updatedb`.
- Use only the commands and concepts covered so far:
  - `vi` or `vim`
  - `locate`
  - `updatedb`
  - `find`
  - `grep`
  - redirection operators such as `>`, `>>`, `2>`, `2>>`, `2>/dev/null`
  - pipes `|`
  - `tee`
- Verify your work by reading the output files you create.

## Part 1: vi / vim

### 1. Confirm that `vi` is available on the system.

Record the path shown by the command you use.

### 2. Open the file `vi-kodekloud.txt` in the lab directory with `vi`.

In the file:

- enter insert mode
- type `Hello world!`
- return to command mode
- save and quit

### 3. State the operation modes used in `vi`.

Write down the mode used for typing text, the mode used for editor commands, and the mode used for commands such as save and quit.

### 4. Open `testfile.txt` with `vi` and move the line currently at line 9 so that it becomes line 5.

Save the file and quit.

### 5. Open `testfile.txt` again and delete the first three lines.

Save the file and quit.

### 6. Open `notes.txt` with `vi`, copy one full line, paste it below the original, then save and quit.

## Part 2: locate, find, and grep

### 7. Update the locate database and use `locate` to find every file named `City.txt` created in the lab.

Save the output to:

```text
$HOME/session11-lab/results/city-locate.txt
```

### 8. Use `find` to locate the file named `caleston-code` somewhere under the lab's `opt` directory.

Save the full path to:

```text
$HOME/session11-lab/results/caleston-path.txt
```

### 9. Use `find` to locate the file named `dummy.service` somewhere under the lab's `etc` directory.

Save the full path to:

```text
$HOME/session11-lab/results/dummy-service-path.txt
```

### 10. Search recursively under the lab's `etc` directory for the text `172.16.238.197`.

Save the matching output to:

```text
$HOME/session11-lab/results/ip-match.txt
```

### 11. Use `grep` to find the line containing the word `second` in `sample.txt`.

Save the output to:

```text
$HOME/session11-lab/results/grep-second.txt
```

### 12. Use `grep -i` to find the line containing the word `capital` in `sample.txt`.

Save the output to:

```text
$HOME/session11-lab/results/grep-capital.txt
```

### 13. Use `grep -v` to print every line in `sample.txt` except the line containing `printed`.

Save the output to:

```text
$HOME/session11-lab/results/grep-not-printed.txt
```

### 14. Use `grep -r` to search for the text `third line` somewhere inside the lab directory.

Save the output to:

```text
$HOME/session11-lab/results/grep-third-line.txt
```

## Part 3: Redirection and Pipes

### 15. Create a file named `file_with_data.txt` inside the lab directory.

Its content should be exactly:

```text
a file in my home directory
```

Use output redirection.

### 16. Append one more line to the same file:

```text
this line was appended later
```

Use append redirection.

### 17. Run the Python script `my_python_test.py` and redirect standard error to:

```text
$HOME/session11-lab/results/py_error.txt
```

### 18. Read the compressed file `tail.1.gz` without extracting it permanently, and redirect its contents to:

```text
$HOME/session11-lab/results/pipes.txt
```

### 19. Use a pipe to search for the word `Hello` in `sample.txt` and save the result to:

```text
$HOME/session11-lab/results/hello-lines.txt
```

### 20. Use `tee` to display the value of `$SHELL` on the screen and save it at the same time to:

```text
$HOME/session11-lab/results/shell.txt
```

Then append this line to the same file using `tee -a`:

```text
This is the Bash shell
```

## Submission Checklist

Before you finish, confirm that:

- you ran `prepare-lab.sh`
- you edited files with `vi`
- you used `locate`, `updatedb`, `find`, and `grep`
- you created output files using redirection
- you redirected stderr from the Python script
- you used a pipe and `tee`
- you verified the created result files with `cat`
