# Linux for Beginners: Session 9 Homework

## Lab: Archive, Compression, and Disk Usage Workout

## Scenario

You have been asked to prepare a support bundle and reclaim disk space on a Linux server. Before sending files to another team, you need to inspect disk usage, identify large directories, archive important data, compare compression methods, and verify the resulting file sizes.

## Environment Setup

Make the preparation script executable and run it:

```bash
chmod +x prepare-archive-lab.sh
./prepare-archive-lab.sh
```

The script will create a practice dataset under your home directory with directories, logs, reports, and files of different sizes for archiving and compression exercises.

## Important Notes

- Run all commands on the dataset created by the preparation script.
- Record the output you see on your own system.
- Use `du`, `df`, `ls -lh`, `stat`, or similar tools to verify sizes when needed.
- Use separate output files for the different compressed archives so you can compare them.

## Questions

### 1. Check the overall disk usage of the filesystem that contains the lab directory.

Record the total size, used space, and available space.

### 2. Find the total size of the lab directory.

Use the appropriate command to measure the size of the whole practice dataset.

### 3. Identify the largest subdirectory inside the lab directory.

Use a command that helps you compare directory sizes.

### 4. Create a plain tar archive of the `reports` directory.

Do not compress it yet.

### 5. Create compressed archives of the `reports` directory using:

- gzip
- bzip2
- xz

### 6. Compare the sizes of the plain tar archive and the three compressed archives.

Record which one is the largest and which one is the smallest on your system.

### 7. List the contents of one of the compressed archives without extracting it.

Choose one archive and display its file list only.

### 8. Extract one compressed archive into a new restore directory.

Verify that the files were restored correctly.

### 9. Archive the entire lab directory into a support bundle.

Choose one compression format and create a single archive that could be sent to another team.

### 10. Find the largest individual file in the lab dataset.

Use the command line to inspect file sizes and identify the largest file.

## Submission Checklist

Before you finish, confirm that:

- you ran `prepare-archive-lab.sh`
- you checked both disk usage and directory usage
- you created a plain tar archive
- you created gzip, bzip2, and xz compressed archives
- you compared archive sizes
- you listed archive contents without extraction
- you extracted and verified one archive
- you created a final support bundle
- you identified the largest file in the dataset
