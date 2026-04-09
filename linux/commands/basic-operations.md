# Linux Commands: ls and cp

## Topic: Basic File Operations – ls and cp, Cloud VM Access

---

## Overview
The `ls` and `cp` commands are essential for Linux file management.  
This document covers their syntax, options, practical examples, and usage on cloud servers.  
These commands are also part of LPIC exam preparation.

---

## 1. ls Command

### Purpose
Display the contents of a directory, including files and subdirectories.

### Syntax
```bash
ls [OPTION] [FILE...]
# List files in the current directory
ls

# List files with details (permissions, owner, size, modification date)
ls -l

# List all files including hidden ones
ls -a

# Sort by modification time
ls -lt

# Recursively list subdirectories
ls -R /home/ubuntu
# Linux Command: cp

## Date: 2026-04-07
## Topic: File Copy Operations – cp

---

## Overview
The `cp` command is used to copy files and directories in Linux.
It is a fundamental command required for LPIC certification and is widely used in real-world server and cloud environments.
This document covers syntax, options, examples, and practical usage.

---

## Purpose
Copy files or directories from a source location to a destination.

---

＃＃　Syntax
```bash
cp [OPTION] SOURCE DEST
```

---

## Common Options

| Option | Description |
|--------|-------------|
| -r     | Copy directories recursively |
| -a     | Archive mode (preserves permissions, ownership, timestamps) |
| -i     | Prompt before overwrite |
| -v     | Show detailed output (verbose) |

---

## Examples

```bash
# Copy a single file
cp file1.txt file2.txt

# Copy a file to another directory
cp file1.txt /home/ubuntu/

# Copy a directory recursively
cp -r dir1/ dir2/

# Copy and preserve attributes (recommended for configs)
cp -a config.conf /backup/config.conf

# Copy with confirmation before overwrite
cp -i file1.txt file2.txt

# Show detailed output during copy
cp -v file1.txt /home/ubuntu/
```

---

## Use Cases

- Backup configuration files before editing
- Duplicate files for testing purposes
- Copy scripts and data between directories
- Maintain identical file structures on servers

---

## Practical Workflow (LPIC + Cloud Ready)

### Step 1: Backup configuration file locally
```bash
cp -a /home/ubuntu/config.conf /home/ubuntu/backup/
```

### Step 2: Connect to cloud server
```bash
ssh -i ~/.ssh/id_ed25519 ubuntu@<server_ip>
```

### Step 3: Backup file on cloud server
```bash
cp -a /home/ubuntu/config.conf /home/ubuntu/backup/
```

### Step 4: Verify backup
```bash
ls -l /home/ubuntu/backup/
```

---

## Practical Insight

- `cp -a` is essential for preserving file attributes in production environments
- Always create backups before modifying important files
- Combining `cp` with SSH enables safe file handling on remote servers
- This workflow reflects both LPIC exam scenarios and real cloud operations

---

## Next Steps

- Learn related commands: `ls`, `mv`, `rm`, `chmod`, `chown`
- Integrate file operations into automation scripts
- Continue documenting daily Linux operations for GitHub portfolio
