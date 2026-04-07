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
