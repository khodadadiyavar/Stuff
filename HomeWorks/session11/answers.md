# Linux for Beginners: Session 11 Answers

## Lab: Editing, Searching, and Redirecting in a Support Scenario

## Answer Key

### 1. Confirm that `vi` is available on the system.

Answer:

Use:

```bash
which vi
```

Description:

In this question, you learn how to check whether the `vi` editor is available and where it is located on the system.

How to solve:

Run:

```bash
which vi
```

This prints the path to the `vi` command.

### 2. Open the file `vi-kodekloud.txt` in the lab directory with `vi`.

Answer:

Use:

```bash
vi "$HOME/session11-lab/vi-kodekloud.txt"
```

Then:

- press `i`
- type `Hello world!`
- press `Esc`
- type `:wq`

Description:

In this question, you learn how to open a file, switch to insert mode, type text, return to command mode, and save and quit.

How to solve:

Open the file with `vi`, enter insert mode with `i`, type the text, return to command mode with `Esc`, then save and quit with `:wq`.

### 3. State the operation modes used in `vi`.

Answer:

The modes are:

- command mode
- insert mode
- last line mode

Description:

In this question, you learn the three main operation modes used in `vi`.

How to solve:

Remember:

- command mode is the default mode after opening a file
- insert mode is used for typing text
- last line mode is entered with `:` for commands like save and quit

### 4. Open `testfile.txt` with `vi` and move the line currently at line 9 so that it becomes line 5.

Answer:

Open:

```bash
vi "$HOME/session11-lab/testfile.txt"
```

One valid method is:

- go to line 9
- press `dd`
- go to line 4
- press `p`
- save with `:wq`

Description:

In this question, you learn how to move a line by deleting it and pasting it at a new location.

How to solve:

Delete the line you want to move with `dd`, move to the line above the target position, then paste it with `p`.

### 5. Open `testfile.txt` again and delete the first three lines.

Answer:

Open:

```bash
vi "$HOME/session11-lab/testfile.txt"
```

Then use:

```text
3dd
```

Save with:

```text
:wq
```

Description:

In this question, you learn how to delete multiple lines in command mode.

How to solve:

From the top of the file, use `3dd` to delete three lines. Then save and quit.

### 6. Open `notes.txt` with `vi`, copy one full line, paste it below the original, then save and quit.

Answer:

Open:

```bash
vi "$HOME/session11-lab/notes.txt"
```

Then:

- place the cursor on the line
- press `yy`
- press `p`
- save with `:wq`

Description:

In this question, you learn how to copy and paste a full line in `vi`.

How to solve:

Use `yy` to copy a line and `p` to paste it below the current line.

### 7. Update the locate database and use `locate` to find every file named `City.txt` created in the lab.

Answer:

Use:

```bash
sudo updatedb
locate City.txt > "$HOME/session11-lab/results/city-locate.txt"
```

Description:

In this question, you learn that `locate` uses a database, and that `updatedb` refreshes it before searching.

How to solve:

Run `updatedb` first, then use `locate` and redirect the results into the target file.

### 8. Use `find` to locate the file named `caleston-code` somewhere under the lab's `opt` directory.

Answer:

Use:

```bash
find "$HOME/session11-lab/opt" -name caleston-code > "$HOME/session11-lab/results/caleston-path.txt"
```

Description:

In this question, you learn how to search for a file by name under a specific directory and save the resulting path.

How to solve:

Use `find` with `-name` and redirect the result to the required file.

### 9. Use `find` to locate the file named `dummy.service` somewhere under the lab's `etc` directory.

Answer:

Use:

```bash
find "$HOME/session11-lab/etc" -name dummy.service > "$HOME/session11-lab/results/dummy-service-path.txt"
```

Description:

In this question, you learn how to find a specific file inside a configuration-style directory tree.

How to solve:

Use `find` with the `etc` lab directory as the search root and redirect the result to the required file.

### 10. Search recursively under the lab's `etc` directory for the text `172.16.238.197`.

Answer:

Use:

```bash
grep -r '172.16.238.197' "$HOME/session11-lab/etc" > "$HOME/session11-lab/results/ip-match.txt"
```

Description:

In this question, you learn how to search through files recursively with `grep`.

How to solve:

Use `grep -r` on the target directory and redirect the matching output into the results file.

### 11. Use `grep` to find the line containing the word `second` in `sample.txt`.

Answer:

Use:

```bash
grep second "$HOME/session11-lab/sample.txt" > "$HOME/session11-lab/results/grep-second.txt"
```

Description:

In this question, you learn how to find a matching line with basic `grep`.

How to solve:

Run `grep` with the target word and redirect the output into the results file.

### 12. Use `grep -i` to find the line containing the word `capital` in `sample.txt`.

Answer:

Use:

```bash
grep -i capital "$HOME/session11-lab/sample.txt" > "$HOME/session11-lab/results/grep-capital.txt"
```

Description:

In this question, you learn how to do a case-insensitive search with `grep -i`.

How to solve:

Use `grep -i` so that uppercase and lowercase letters are both matched.

### 13. Use `grep -v` to print every line in `sample.txt` except the line containing `printed`.

Answer:

Use:

```bash
grep -v printed "$HOME/session11-lab/sample.txt" > "$HOME/session11-lab/results/grep-not-printed.txt"
```

Description:

In this question, you learn how to invert a match and print lines that do not contain a target string.

How to solve:

Use `grep -v` and redirect the remaining lines into the results file.

### 14. Use `grep -r` to search for the text `third line` somewhere inside the lab directory.

Answer:

Use:

```bash
grep -r "third line" "$HOME/session11-lab" > "$HOME/session11-lab/results/grep-third-line.txt"
```

Description:

In this question, you learn how to search recursively through an entire lab tree for a phrase.

How to solve:

Use `grep -r` on the lab directory and redirect the matching output.

### 15. Create a file named `file_with_data.txt` inside the lab directory.

Answer:

Use:

```bash
echo "a file in my home directory" > "$HOME/session11-lab/file_with_data.txt"
```

Description:

In this question, you learn how to create a file and write content into it using stdout redirection.

How to solve:

Use `echo` with `>` to create the file and write the first line.

### 16. Append one more line to the same file.

Answer:

Use:

```bash
echo "this line was appended later" >> "$HOME/session11-lab/file_with_data.txt"
```

Description:

In this question, you learn how to append output to an existing file.

How to solve:

Use `>>` to add the second line without overwriting the first one.

### 17. Run the Python script `my_python_test.py` and redirect standard error.

Answer:

Use:

```bash
python3 "$HOME/session11-lab/my_python_test.py" 2> "$HOME/session11-lab/results/py_error.txt"
```

Description:

In this question, you learn how to redirect standard error into a file.

How to solve:

Run the command and use `2>` to write only stderr to the destination file.

### 18. Read the compressed file `tail.1.gz` without extracting it permanently, and redirect its contents.

Answer:

Use:

```bash
gzip -dc "$HOME/session11-lab/man1/tail.1.gz" > "$HOME/session11-lab/results/pipes.txt"
```

Description:

In this question, you learn how to read a gzipped file without extracting it as a permanent file on disk.

How to solve:

Use `gzip -dc` to send the uncompressed content to stdout, then redirect that output into the destination file.

### 19. Use a pipe to search for the word `Hello` in `sample.txt` and save the result.

Answer:

Use:

```bash
cat "$HOME/session11-lab/sample.txt" | grep Hello > "$HOME/session11-lab/results/hello-lines.txt"
```

Description:

In this question, you learn how to connect commands with a pipe and then redirect the final output into a file.

How to solve:

Send the output of `cat` into `grep` with `|`, then redirect the matching output with `>`.

### 20. Use `tee` to display the value of `$SHELL` on the screen and save it at the same time.

Answer:

Use:

```bash
echo "$SHELL" | tee "$HOME/session11-lab/results/shell.txt"
echo "This is the Bash shell" | tee -a "$HOME/session11-lab/results/shell.txt"
```

Description:

In this question, you learn how to show output on the screen and write it to a file at the same time.

How to solve:

Use `tee` for the first write and `tee -a` to append the second line.
