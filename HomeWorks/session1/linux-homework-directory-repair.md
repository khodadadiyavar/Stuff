# Linux Homework: Fix the Broken Directory Structure

## Goal

You are given a directory structure with a few intentional mistakes. Your job is to inspect the files and folders under your home directory and fix the problems using Linux commands.

This exercise is designed to practice:

- navigating directories
- listing files and folders
- renaming directories
- moving directories
- deleting files
- creating missing files

## Prepare the Environment

Open a terminal on a Linux machine and make sure you are working from your home directory:

```bash
cd ~
```

Run this command to create the broken practice environment:

```bash
mkdir -p "$HOME"/{Asia/{China,India/Munbai},Europe/{UK/London,Morocco},Africa/Egypt/Cairo,America/USA} && touch "$HOME/Asia/India/Munbai/City.txt" "$HOME/Europe/UK/London/Tottenham.txt"
```

Optional: inspect the result with one of these commands:

```bash
tree "$HOME"
```

or

```bash
find "$HOME" -maxdepth 4 | sort
```

## Student Tasks

Fix the structure so it matches the intended final layout shown in the reference image.

Complete these tasks:

1. Correct the misspelled directory `Munbai` so it becomes `Mumbai`.
2. Move the `Morocco` directory to the correct continent.
3. Remove the incorrect file `Tottenham.txt` from `London`.
4. Create the missing file `City.txt` inside `Cairo`.
5. Keep the rest of the structure unchanged.

## Rules

- Use Linux commands only.
- Do not delete and recreate the entire tree.
- Fix the existing structure step by step.
- Work only inside your home directory for this exercise.

## Expected Final Structure

After the fixes, the relevant part of the home directory should look like this:

```text
$HOME
|-- Africa
|   |-- Egypt
|   |   `-- Cairo
|   |       `-- City.txt
|   `-- Morocco
|-- America
|   `-- USA
|-- Asia
|   |-- China
|   `-- India
|       `-- Mumbai
|           `-- City.txt
`-- Europe
    `-- UK
        `-- London
```

## Expected Outcome

When the student is finished:

- `Munbai` no longer exists
- `Mumbai` exists in `Asia/India`
- `Morocco` is inside `Africa`
- `Tottenham.txt` no longer exists
- `City.txt` exists in `Africa/Egypt/Cairo`
- the rest of the directory tree is still present

## Verification

The student can verify the result with:

```bash
tree "$HOME"
```

or

```bash
find "$HOME" -maxdepth 4 | sort
```
