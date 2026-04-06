# System Analysis Commands

This document summarizes commands used for analyzing binary dependencies  
and troubleshooting runtime issues in Linux environments.

---

## 1. ldd command

### Overview
`ldd` displays the shared library dependencies of a binary executable.  
It is commonly used when a program fails to start due to missing libraries.

### Syntax
ldd <file>

### Examples

#### Check system binary
$ ldd /bin/ls

#### Check custom application
$ ldd ./myapp

#### Example output (missing library)
libexample.so => not found

### Use Cases

- Debug "No such file or directory" or execution errors
- Identify missing shared libraries
- Verify runtime dependencies after deployment

### Practical Insight

In real environments, `ldd` is often used when a binary exists but does not run.

Example scenario:

$ ./app  
→ error while loading shared libraries

Then:

$ ldd ./app  
→ shows "not found"

This helps quickly identify missing dependencies.

### Important Notes

- Avoid running `ldd` on untrusted binaries
- It may execute code depending on system configuration

---

## 2. ldconfig command

### Overview
`ldconfig` updates the shared library cache used by the dynamic linker.  
It ensures that newly installed libraries are recognized by the system.

### Syntax
ldconfig [OPTION]

### Examples

#### Update library cache
$ sudo ldconfig

#### Show registered libraries
$ ldconfig -p | grep libssl

### Use Cases

- Register manually installed libraries
- Fix runtime errors after library installation
- Verify available shared libraries

### Practical Insight

A common issue occurs when a library is installed but not recognized:

1. Place library in `/usr/local/lib`
2. Run application → fails
3. Run:
   $ sudo ldconfig
4. Retry → works

This happens because the cache was not updated.

---

## Workflow (Dependency Troubleshooting)

### Real-world debugging flow

1. Run application  
   → execution error occurs  

2. Check dependencies  
   → `ldd ./app`  

3. Identify missing libraries  
   → "not found"  

4. Install or place required library  

5. Update cache  
   → `sudo ldconfig`  

6. Re-run application  

---

## Related Configuration

- `/etc/ld.so.conf`
- `/etc/ld.so.conf.d/`
- `LD_LIBRARY_PATH`

These define where the system searches for shared libraries.

---

## Summary

`ldd` and `ldconfig` are essential tools for diagnosing and resolving  
runtime dependency issues.

They are frequently used in real-world environments when applications fail  
to start due to missing or misconfigured libraries.

## man command

### Overview
`man` (manual) displays detailed documentation for Linux commands,  
system calls, and configuration files.

It is a fundamental tool for learning commands and troubleshooting issues  
in real-world environments.

---

### Syntax
man [SECTION] command

---

### Examples

#### View manual for a command
$ man ls

#### Specify section
$ man 5 passwd

#### Search manuals by keyword
$ man -k network

#### Display all matching manual pages
$ man -a passwd

---

### Sections

| Section | Description |
|--------|------------|
| 1 | User commands |
| 2 | System calls |
| 3 | Library functions |
| 4 | Devices |
| 5 | File formats |
| 6 | Games |
| 7 | Miscellaneous |
| 8 | System administration |

---

### Navigation

| Key | Action |
|-----|--------|
| Space | Next page |
| b | Previous page |
| /keyword | Search |
| n | Next match |
| q | Quit |

---

### Use Cases

- Learn command usage and options
- Investigate unknown commands
- Understand configuration file formats
- Troubleshoot system behavior

---

### Practical Insight

In real environments, `man` is used when you encounter unfamiliar commands  
or need more detailed information than `--help`.

Example:

$ tar --help  
→ Shows basic usage

$ man tar  
→ Provides detailed explanation, options, and examples

---

### Practical Workflow

#### Real-world usage flow

1. Encounter unknown command  
   → e.g. `tar`

2. Open manual  
   → `man tar`

3. Search specific option  
   → `/extract`

4. Apply command  
   → `tar -xvf file.tar`

---

### man -k (apropos)

`man -k` searches manual page names and descriptions.

Example:

$ man -k archive

This is useful when you do not know the exact command name.

---

### man vs --help

| Feature | man | --help |
|--------|-----|--------|
| Detail | High | Low |
| Speed | Slower | Fast |
| Use case | Deep understanding | Quick reference |

---

### Important Notes

- Requires manual pages to be installed
- On minimal systems, install with:
  → `sudo apt install man-db`

---

### Practical Insight (Advanced)

- `man` is often the only reliable documentation in restricted environments  
  (e.g., servers without internet access)

- Engineers frequently rely on `man` during troubleshooting and system operation

---

### Summary

`man` is an essential command for understanding Linux systems  
and solving problems independently.

Effective use of `man` enables engineers to quickly learn commands,  
debug issues, and operate systems without external references.
