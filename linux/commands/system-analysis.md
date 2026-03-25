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
