# Package Management Commands

This document covers commands used for managing packages in Debian-based Linux systems.

---

## 1. dpkg command

### Overview
`dpkg` is a low-level package management tool used to install, remove,  
and inspect `.deb` packages on Debian-based systems.

### Syntax
dpkg [OPTION] <package>

---

### Examples

#### Install a package
$ sudo dpkg -i package.deb

#### Remove a package
$ sudo dpkg -r package_name

#### List installed packages
$ dpkg -l

#### Check package information
$ dpkg -s package_name

#### Find which package owns a file
$ dpkg -S /usr/bin/ls

---

### Options
| Option | Description |
|--------|------------|
| -i | Install package |
| -r | Remove package |
| -l | List installed packages |
| -s | Show package status |
| -S | Search package by file |

---

### Use Cases

- Install local `.deb` packages
- Investigate installed packages
- Identify file ownership
- Troubleshoot package-related issues

---

### Practical Insight

In real environments, `dpkg` is often used when installing packages manually.

Example scenario:

$ sudo dpkg -i app.deb  
→ dependency errors occur

This happens because `dpkg` does not resolve dependencies automatically.

To fix this:

$ sudo apt-get install -f

This installs missing dependencies and completes the setup.

---

### Workflow (Package Troubleshooting)

1. Install package  
   → `dpkg -i package.deb`  

2. Encounter dependency error  

3. Fix dependencies  
   → `sudo apt-get install -f`  

4. Verify installation  
   → `dpkg -l | grep package_name`  

---

### Important Notes

- Requires administrative privileges for installation/removal
- Does not automatically resolve dependencies
- Higher-level tools like `apt` are commonly used for dependency management

---

### Summary

`dpkg` is a fundamental tool for managing packages in Debian-based systems.  
It is especially useful for manual installations and troubleshooting  
package-related issues in real-world environments.
