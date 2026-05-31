# Linux for Beginners: Session 9 Answers

## Lab: Archive, Compression, and Disk Usage Workout

## Answer Key

### 1. Check the overall disk usage of the filesystem that contains the lab directory.

Answer:

Use:

```bash
df -h
```

Description:

In this question, you learn how to inspect filesystem-level capacity and free space.

How to solve:

Run:

```bash
df -h
```

If you want to focus on the lab directory specifically:

```bash
df -h "$HOME/session9-archive-lab"
```

### 2. Find the total size of the lab directory.

Answer:

Use:

```bash
du -sh "$HOME/session9-archive-lab"
```

Description:

In this question, you learn how to measure the total size of a directory tree.

How to solve:

Run:

```bash
du -sh "$HOME/session9-archive-lab"
```

### 3. Identify the largest subdirectory inside the lab directory.

Answer:

Use:

```bash
du -sh "$HOME/session9-archive-lab"/* | sort -h
```

Description:

In this question, you learn how to compare directory sizes and identify the largest consumer of space.

How to solve:

Run:

```bash
du -sh "$HOME/session9-archive-lab"/* | sort -h
```

The last line in the sorted output is the largest item.

### 4. Create a plain tar archive of the `reports` directory.

Answer:

Use:

```bash
tar -cf reports.tar -C "$HOME/session9-archive-lab" reports
```

Description:

In this question, you learn how to create an uncompressed tar archive.

How to solve:

Run:

```bash
tar -cf reports.tar -C "$HOME/session9-archive-lab" reports
```

Then verify that the file exists:

```bash
ls -lh reports.tar
```

### 5. Create compressed archives of the `reports` directory using gzip, bzip2, and xz.

Answer:

Use:

```bash
tar -czf reports.tar.gz -C "$HOME/session9-archive-lab" reports
tar -cjf reports.tar.bz2 -C "$HOME/session9-archive-lab" reports
tar -cJf reports.tar.xz -C "$HOME/session9-archive-lab" reports
```

Description:

In this question, you learn how to create tar archives compressed with different algorithms.

How to solve:

Run each command and create one archive per compression format.

### 6. Compare the sizes of the plain tar archive and the three compressed archives.

Answer:

Use:

```bash
ls -lh reports.tar reports.tar.gz reports.tar.bz2 reports.tar.xz
```

Description:

In this question, you learn how to compare resulting archive sizes after different compression methods.

How to solve:

Run:

```bash
ls -lh reports.tar reports.tar.gz reports.tar.bz2 reports.tar.xz
```

Record which archive is largest and which is smallest on your system.

### 7. List the contents of one of the compressed archives without extracting it.

Answer:

Use:

```bash
tar -tf reports.tar.gz
```

Description:

In this question, you learn how to inspect archive contents without extracting files.

How to solve:

Run:

```bash
tar -tf reports.tar.gz
```

You can use the same pattern for `.tar.bz2` and `.tar.xz`.

### 8. Extract one compressed archive into a new restore directory.

Answer:

Use:

```bash
mkdir -p restored-reports
tar -xf reports.tar.gz -C restored-reports
```

Description:

In this question, you learn how to restore archived files into a chosen destination.

How to solve:

Run:

```bash
mkdir -p restored-reports
tar -xf reports.tar.gz -C restored-reports
```

Then verify the restored content:

```bash
find restored-reports -maxdepth 3 | sort
```

### 9. Archive the entire lab directory into a support bundle.

Answer:

One valid example is:

```bash
tar -cJf session9-support-bundle.tar.xz -C "$HOME" session9-archive-lab
```

Description:

In this question, you learn how to package a complete directory tree into a single archive suitable for transfer.

How to solve:

Choose one compression format and archive the whole lab directory. For example:

```bash
tar -cJf session9-support-bundle.tar.xz -C "$HOME" session9-archive-lab
```

Then verify the file size:

```bash
ls -lh session9-support-bundle.tar.xz
```

### 10. Find the largest individual file in the lab dataset.

Answer:

One simple approach is:

```bash
find "$HOME/session9-archive-lab" -type f -exec ls -lh {} + | sort -k5 -h
```

Description:

In this question, you learn how to inspect file sizes across a directory tree and determine the largest file.

How to solve:

Run:

```bash
find "$HOME/session9-archive-lab" -type f -exec ls -lh {} + | sort -k5 -h
```

The largest file will appear at the end of the sorted output.
