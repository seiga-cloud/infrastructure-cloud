# System Analysis Commands

This document covers commands used for analyzing binaries and system behavior in Linux.

---

## 1. ldd command

### Overview
`ldd` displays the shared library dependencies of a binary executable.  
It helps identify which libraries are required for a program to run.

### Syntax
ldd <file>

### Examples

#### Check dependencies of a binary
$ ldd /bin/ls

Displays all shared libraries required by the `ls` command.

#### Check custom program
$ ldd ./myapp

Shows required libraries for a compiled application.

### Output Explanation

- library name → required shared library  
- => path → actual file location  
- (0x...) → memory address (for reference)

### Use Cases

- Identify missing libraries
- Debug application startup failures
- Verify runtime dependencies
- Analyze compiled binaries

### Practical Insight

If a required library is missing, `ldd` will display "not found".  
This is a common cause of application execution errors.

Example:

libexample.so => not found

This indicates that the required library is not installed or not in the library path.

### Important Notes

- Use caution when running `ldd` on untrusted binaries  
- It may execute code depending on the system configuration

### Summary

`ldd` is an essential tool for analyzing binary dependencies  
and troubleshooting runtime issues in Linux systems.

Related: `ldconfig` is used to update shared library cache.
