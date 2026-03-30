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
## 2. apt command

### Overview
`apt` is a high-level package management tool for Debian-based systems.  
It simplifies package installation, removal, and updates by handling dependencies automatically.

### Syntax
apt [COMMAND] [PACKAGE]

---

### Examples

#### Install a package
$ sudo apt install nginx

#### Remove a package
$ sudo apt remove nginx

#### Update package list
$ sudo apt update

#### Upgrade packages
$ sudo apt upgrade

#### Search for a package
$ apt search nginx

---

### Use Cases

- Install packages with automatic dependency resolution
- Keep system packages up to date
- Search and manage available packages

---

### Practical Insight

In modern environments, `apt` is the standard tool for package management.

Typical workflow:

$ sudo apt update  
$ sudo apt install package_name  

This ensures the latest package information is used before installation.

---

## 3. apt-get command

### Overview
`apt-get` is a lower-level package management tool compared to `apt`.  
It provides more stable and script-friendly behavior.

### Syntax
apt-get [COMMAND] [PACKAGE]

---

### Examples

#### Install a package
$ sudo apt-get install nginx

#### Remove a package
$ sudo apt-get remove nginx

#### Update package list
$ sudo apt-get update

#### Upgrade packages
$ sudo apt-get upgrade

#### Fix broken dependencies
$ sudo apt-get install -f

---

### Use Cases

- Script automation
- System provisioning
- Fixing broken package dependencies

---

### Practical Insight

`apt-get` is often preferred in scripts because its behavior is more stable  
and less likely to change compared to `apt`.

It is also commonly used to fix dependency issues after using `dpkg`.

Example:

$ sudo dpkg -i app.deb  
→ dependency errors  

$ sudo apt-get install -f  
→ resolves dependencies  

---

## 4. apt-cache command

### Overview
`apt-cache` is used to query the local package cache.  
It allows searching and inspecting package information without installing them.

### Syntax
apt-cache [COMMAND] [PACKAGE]

---

### Examples

#### Search for a package
$ apt-cache search nginx

#### Show package details
$ apt-cache show nginx

#### Check package dependencies
$ apt-cache depends nginx

---

### Use Cases

- Investigate package details before installation
- Check dependencies
- Explore available packages

---

### Practical Insight

Before installing a package, checking its dependencies with `apt-cache depends`  
helps understand what will be installed.

This is useful in controlled environments where unnecessary packages should be avoided.

---

## Workflow (Package Management in Practice)

### Real-world usage flow

1. Update package list  
   → `sudo apt update`

2. Search package  
   → `apt search nginx` or `apt-cache search nginx`

3. Check details  
   → `apt-cache show nginx`

4. Install package  
   → `sudo apt install nginx`

5. Troubleshoot if needed  
   → `dpkg -i` → error  
   → `sudo apt-get install -f`

---

## Comparison

| Command | 특징 |
|--------|------|
| dpkg | Low-level, manual package management |
| apt | User-friendly, handles dependencies |
| apt-get | Stable, script-oriented |
| apt-cache | Query package information |

---

## Summary
## 5. rpm command

### Overview
`rpm` is a low-level package management tool used in RPM-based distributions  
such as Red Hat, CentOS, and Fedora.

It allows installation, removal, and inspection of `.rpm` packages.

### Syntax
rpm [OPTION] <package>

---

### Examples

#### Install a package
$ sudo rpm -ivh package.rpm

#### Upgrade a package
$ sudo rpm -Uvh package.rpm

#### Remove a package
$ sudo rpm -e package_name

#### Query installed packages
$ rpm -qa

#### Check package information
$ rpm -qi package_name

#### List files in a package
$ rpm -ql package_name

---

### Options
| Option | Description |
|--------|------------|
| -i | Install package |
| -U | Upgrade package |
| -e | Erase package |
| -q | Query package |
| -v | Verbose |
| -h | Show progress |

---

### Use Cases

- Install local `.rpm` packages
- Inspect installed packages
- Verify package contents
- Troubleshoot package issues

---

### Practical Insight

Similar to `dpkg`, `rpm` does not automatically resolve dependencies.

Example scenario:

$ sudo rpm -ivh app.rpm  
→ dependency errors occur

To resolve this, higher-level tools like `dnf` or `yum` are typically used.

---

### Important Notes

- Requires administrative privileges
- Dependency resolution must be handled separately
- Commonly used in enterprise Linux environments

---

## 6. rpm2cpio command

### Overview
`rpm2cpio` converts an RPM package into a CPIO archive.  
This allows extracting files without installing the package.

### Syntax
rpm2cpio <package.rpm> | cpio -idmv

---

### Examples

#### Extract files from an RPM package
$ rpm2cpio package.rpm | cpio -idmv

---

### Use Cases

- Inspect package contents without installation
- Extract specific files from a package
- Analyze package structure for troubleshooting

---

### Practical Insight

In real environments, `rpm2cpio` is useful when:

- You do not want to install the package
- You only need a specific file (e.g., configuration or binary)

Example scenario:

1. Download `.rpm` package
2. Extract contents  
   → `rpm2cpio package.rpm | cpio -idmv`
3. Copy only required files

This is especially useful in restricted or minimal environments.

---

## Workflow (RPM-based Troubleshooting)

### Real-world usage flow

1. Inspect package  
   → `rpm -qi package.rpm`  

2. Check contents  
   → `rpm -qlp package.rpm`  

3. Attempt installation  
   → `sudo rpm -ivh package.rpm`  

4. If dependency errors occur  
   → use `dnf` / `yum`  

5. If installation is not possible  
   → extract files  
   → `rpm2cpio package.rpm | cpio -idmv`  

---

## Comparison (Deb vs RPM)

| Category | Debian-based | RPM-based |
|----------|-------------|----------|
| Low-level | dpkg | rpm |
| High-level | apt / apt-get | dnf / yum |
| Extract package | dpkg-deb | rpm2cpio |

---

## Summary

`rpm` and `rpm2cpio` are essential tools for managing and analyzing packages  
in RPM-based Linux systems.

Understanding both Debian and RPM ecosystems is important for working  
in diverse production environments.
Related: Modern systems use `dnf` instead of `yum` in many environments.

`apt`, `apt-get`, and `apt-cache` are essential tools for package management  
in Debian-based systems.

Understanding when to use each command is critical for efficient system  
administration and troubleshooting in real-world environments.
## 7. yum command

### Overview
`yum` (Yellowdog Updater Modified) is a high-level package manager  
used in older RPM-based distributions such as CentOS and RHEL.

It handles package installation, updates, and dependency resolution.

### Syntax
yum [COMMAND] [PACKAGE]

---

### Examples

#### Install a package
$ sudo yum install nginx

#### Remove a package
$ sudo yum remove nginx

#### Update all packages
$ sudo yum update

#### Search for a package
$ yum search nginx

#### Show package information
$ yum info nginx

---

### Use Cases

- Manage packages on legacy systems
- Install software with dependency resolution
- Maintain system updates

---

### Practical Insight

`yum` is still encountered in older environments.

Example scenario:

- Legacy server (CentOS 7)
- No `dnf` available
- Use `yum` for all package operations

---

## 8. dnf command

### Overview
`dnf` (Dandified YUM) is the modern replacement for `yum`  
used in newer versions of Fedora, CentOS, and RHEL.

It provides better performance and dependency handling.

### Syntax
dnf [COMMAND] [PACKAGE]

---

### Examples

#### Install a package
$ sudo dnf install nginx

#### Remove a package
$ sudo dnf remove nginx

#### Update system
$ sudo dnf upgrade

#### Search for a package
$ dnf search nginx

#### List installed packages
$ dnf list installed

---

### Use Cases

- Modern RPM-based system management
- Faster and more reliable package operations
- Dependency resolution and updates

---

### Practical Insight

In current environments, `dnf` is the standard package manager.

Example:

- RHEL 8 / 9
- Fedora

`dnf` replaces `yum`, but many systems still provide `yum` as a wrapper.

---

## 9. zypper command

### Overview
`zypper` is the command-line package manager used in SUSE-based distributions  
such as openSUSE and SUSE Linux Enterprise.

It supports installation, updates, and repository management.

### Syntax
zypper [COMMAND] [PACKAGE]

---

### Examples

#### Install a package
$ sudo zypper install nginx

#### Remove a package
$ sudo zypper remove nginx

#### Update packages
$ sudo zypper update

#### Refresh repositories
$ sudo zypper refresh

#### Search for a package
$ zypper search nginx

---

### Use Cases

- Manage packages in SUSE environments
- Control repositories and updates
- Enterprise Linux operations

---

### Practical Insight

`zypper` is often used in enterprise environments where SUSE is deployed.

A typical workflow:

$ sudo zypper refresh  
$ sudo zypper install package_name  

Refreshing repositories before installation ensures up-to-date package data.

---

## Workflow (Cross-Distribution Package Management)

### Real-world perspective

Different environments require different tools:

- Debian-based  
  → `apt`

- Red Hat-based (old)  
  → `yum`

- Red Hat-based (modern)  
  → `dnf`

- SUSE-based  
  → `zypper`

Understanding this allows smooth operation across multiple systems.

---

## Comparison

| Distribution | Tool |
|-------------|------|
| Debian / Ubuntu | apt |
| CentOS 7 | yum |
| RHEL 8+ / Fedora | dnf |
| openSUSE / SLES | zypper |

---

## Summary

`yum`, `dnf`, and `zypper` are essential tools for package management  
across different Linux distributions.

Being able to use these tools appropriately depending on the environment  
is a key skill for system administrators and engineers.
Note: Some systems provide `yum` as a symbolic link to `dnf` for compatibility.
