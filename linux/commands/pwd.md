# pwd command

## Overview
`pwd` (Print Working Directory) displays the absolute path of the current working directory.

## Syntax
pwd [OPTION]

## Examples

### Basic usage
$ pwd
/home/user/linux-study

Displays the current working directory.

### Logical vs Physical path
$ pwd -L
/home/user/symlink-dir

$ pwd -P
/actual/path/to/directory

`-L` shows the logical path (including symbolic links),  
while `-P` resolves and displays the actual physical path.

## Options
| Option | Description |
|--------|------------|
| -L | Show logical path (default) |
| -P | Show physical path (resolves symlinks) |

## Use Cases

- Confirm current working directory before executing commands
- Prevent file operation mistakes in scripts
- Debug issues related to symbolic links
- Ensure correct path resolution in automation environments

## Practical Insight

Understanding the difference between logical and physical paths is important  
when working with symbolic links, especially in production environments or scripts.  
Using `pwd -P` helps avoid unexpected behavior caused by symlink resolution.

## Summary

`pwd` is a fundamental command for identifying the current working directory.  
It plays a critical role in safe file operations, scripting, and system troubleshooting.
