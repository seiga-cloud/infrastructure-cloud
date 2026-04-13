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

# Linux Command: mv


## Topic: File Move and Rename Operations – mv

---

## Overview
The `mv` command is used to move or rename files and directories in Linux.
It is commonly used in both system administration and cloud environments.

---

## Purpose
Move files/directories or rename them.

---

## Syntax
```bash
mv [OPTION] SOURCE DEST
```

---

## Common Options

| Option | Description |
|--------|-------------|
| -i     | Prompt before overwrite |
| -v     | Show detailed output |
| -f     | Force overwrite without prompt |

---

## Examples

```bash
# Rename a file
mv file1.txt file2.txt

# Move file to another directory
mv file1.txt /home/ubuntu/

# Move multiple files
mv file1.txt file2.txt /home/ubuntu/

# Move directory
mv dir1/ /home/ubuntu/

# Confirm before overwrite
mv -i file1.txt file2.txt

# Show detailed output
mv -v file1.txt /home/ubuntu/
```

---

## Use Cases

- Rename files during development
- Organize directory structures
- Move logs or config files
- Prepare deployment files

---

## Practical Workflow (LPIC + Cloud)

```bash
# Rename config file before editing
mv config.conf config.conf.bak

# Move backup to safe directory
mv config.conf.bak /home/ubuntu/backup/

# Verify
ls -l /home/ubuntu/backup/
```

---

## Practical Insight

- `mv` is used heavily in log rotation and file organization
- Be careful when overwriting important files
- Combine with `ls` to verify results

---

# Linux Command: mkdir

## Topic: Directory Creation – mkdir

---

## Overview
The `mkdir` command is used to create directories in Linux systems.
It is essential for organizing files and managing project structures.

---

## Purpose
Create new directories.

---

## Syntax
```bash
mkdir [OPTION] DIRECTORY
```

---

## Common Options

| Option | Description |
|--------|-------------|
| -p     | Create parent directories as needed |
| -v     | Show detailed output |

---

## Examples

```bash
# Create a directory
mkdir test

# Create multiple directories
mkdir dir1 dir2 dir3

# Create nested directories
mkdir -p project/src/app

# Show output
mkdir -v test
```

---

## Use Cases

- Create project structures
- Prepare directories for logs or backups
- Organize application files

---

## Practical Workflow (LPIC + Cloud)

```bash
# Create project directory
mkdir -p /home/ubuntu/project/app

# Move into directory
cd /home/ubuntu/project/app

# Verify
ls -l
```

---

## Practical Insight

- `mkdir -p` is widely used in automation scripts
- Helps maintain clean and scalable directory structures
- Essential for DevOps and cloud environments

---

## Next Steps

- Combine with `mv`, `cp`
- Use in shell scripts
- Apply in AWS EC2 setup

# Linux Command: rm

## Topic: File and Directory Removal – rm

---

## Overview
The `rm` command is used to remove (delete) files and directories in Linux.
It is a powerful and potentially dangerous command, widely used in system administration and cloud environments.

---

## Purpose
Delete files or directories.

---

## Syntax
```bash
rm [OPTION] FILE
```

---

## Common Options

| Option | Description |
|--------|-------------|
| -r     | Remove directories recursively |
| -f     | Force deletion without prompt |
| -i     | Prompt before deletion |
| -v     | Show detailed output |

---

## Examples

```bash
# Delete a file
rm file1.txt

# Delete multiple files
rm file1.txt file2.txt

# Delete directory recursively
rm -r dir1/

# Force delete without confirmation
rm -f file1.txt

# Confirm before deleting
rm -i file1.txt

# Show detailed output
rm -v file1.txt
```

---

## Use Cases

- Remove unnecessary files
- Clean up logs and temporary files
- Delete old backups
- Maintain disk space on servers

---

## Practical Workflow (LPIC + Cloud)

```bash
# Remove temporary files
rm -i temp.txt

# Remove old backup directory
rm -r backup_old/

# Verify deletion
ls -l
```

---

## Practical Insight

- `rm -r` is required to delete directories
- `rm -f` should be used carefully (no confirmation)
- Always verify files before deletion
- Commonly used in automation and maintenance scripts

---

## Warning

- Deleted files cannot be easily recovered
- Avoid using `rm -rf /` or similar destructive commands
- Always double-check paths before execution

---

## Next Steps

- Learn `rmdir`, `chmod`, `chown`
- Practice safe deletion on AWS EC2

- # Linux Command: rmdir

## Topic: Empty Directory Removal – rmdir

---

## Overview
The `rmdir` command is used to remove empty directories in Linux.
It is safer than `rm -r` because it only deletes directories that contain no files.

---

## Purpose
Delete empty directories only.

---

## Syntax
```bash
rmdir [OPTION] DIRECTORY
```

---

## Common Options

| Option | Description |
|--------|-------------|
| -v     | Show detailed output |
| -p     | Remove directory and its parent if empty |

---

## Examples

```bash
# Remove an empty directory
rmdir dir1

# Remove nested empty directories
rmdir -p project/app

# Show detailed output
rmdir -v dir1
```

---

## Use Cases

- Clean up empty directories
- Maintain clean project structures
- Safe directory removal

---

## Practical Workflow (LPIC + Cloud)

```bash
# Create test directory
mkdir testdir

# Remove empty directory
rmdir testdir

# Verify
ls -l
```

---

## Practical Insight

- `rmdir` only works on empty directories
- Safer alternative to `rm -r`
- Useful in scripts where accidental deletion must be avoided

---

## Difference from rm

| Command | Behavior |
|--------|----------|
| rm -r  | Deletes directories with contents |
| rmdir  | Deletes empty directories only |

---

## Next Steps

- Combine with `rm`, `mkdir`
- Use in automation scripts
- Apply in AWS EC2 environments
