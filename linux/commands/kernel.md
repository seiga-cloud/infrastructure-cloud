# lspci command

## Overview
`lspci` lists all PCI devices connected to the system.  
It is commonly used to identify hardware such as GPUs, network cards, and storage controllers.

## Syntax
lspci [OPTION]

## Examples

### Basic usage
$ lspci

Displays a list of all PCI devices.

### Show kernel driver information
$ lspci -k

Shows which kernel driver is handling each device.

## Options
| Option | Description |
|--------|------------|
| -k | Show kernel driver information |
| -v | Show detailed information |

## Use Cases

- Identify installed hardware components
- Verify if a device is recognized by the system
- Check which driver is in use
- Troubleshoot hardware or driver issues

## Practical Insight

`lspci -k` is particularly useful for confirming whether the correct driver is loaded.  
If a device is listed but no driver is in use, manual driver loading may be required.

## Summary

`lspci` is essential for inspecting PCI hardware and diagnosing driver-related issues in Linux systems.

# lsusb command

## Overview
`lsusb` lists all USB devices connected to the system.  
It is useful for identifying peripherals such as keyboards, mice, storage devices, and cameras.

## Syntax
lsusb [OPTION]

## Examples

### Basic usage
$ lsusb

Displays all connected USB devices.

### Show detailed information
$ lsusb -v

Displays verbose output (may require root privileges).

## Options
| Option | Description |
|--------|------------|
| -v | Show detailed device information |

## Use Cases

- Confirm USB device recognition
- Identify vendor ID and product ID
- Troubleshoot unrecognized USB devices
- Validate hardware connections

## Practical Insight

If a USB device is not functioning, verifying its presence with `lsusb` helps determine  
whether the issue is hardware-related or driver-related.

## Summary

`lsusb` is a fundamental tool for managing and troubleshooting USB devices in Linux environments.
## dmesg command

### Overview
`dmesg` displays kernel ring buffer messages.  
It provides information about system boot, hardware detection, and driver initialization.

### Syntax
dmesg [OPTION]

### Examples

#### Basic usage
$ dmesg

Displays all kernel messages.

#### Show human-readable timestamps
$ dmesg -T

Converts timestamps into a human-readable format.

#### Show recent messages
$ dmesg | tail

Displays the most recent kernel messages.

#### Filter errors
$ dmesg | grep -i error

Shows only error-related messages.

### Options
| Option | Description |
|--------|------------|
| -T | Show human-readable timestamps |
| -l | Filter by log level (error, warn, info) |
| -w | Follow new messages in real time |

### Use Cases

- Check hardware detection after boot
- Diagnose driver initialization issues
- Investigate system errors and warnings
- Monitor kernel logs in real time

### Practical Insight

`dmesg` is particularly useful immediately after connecting new hardware.  
By reviewing recent logs (`dmesg | tail`), you can verify whether the system  
recognized the device or encountered errors.

Combining `dmesg` with `grep` is essential for efficiently analyzing logs  
in real-world environments.

---

##  journalctl (Kernel Logs)

### Overview
`journalctl -k` displays kernel messages managed by systemd journal.  
It is an alternative to `dmesg` on modern Linux systems.

### Examples

#### Show kernel logs
$ journalctl -k

#### Show latest logs
$ journalctl -k -n 50

#### Follow logs in real time
$ journalctl -k -f

### Practical Insight

On systems using systemd, `journalctl -k` provides persistent logs,  
while `dmesg` only shows the current boot messages.

Using both commands allows more comprehensive troubleshooting.

---

## Example Workflow (Troubleshooting)

1. Check hardware connection  
   → `lspci` / `lsusb`

2. Verify driver status  
   → `lsmod`

3. Load necessary modules  
   → `modprobe`

4. Check kernel messages  
   → `dmesg` or `journalctl -k`

This workflow enables efficient identification and resolution  
of hardware and driver-related issues.
# lsmod command

## Overview
`lsmod` displays the status of currently loaded Linux kernel modules.  
It helps identify which drivers are active in the system.

## Syntax
lsmod

## Examples

### Basic usage
$ lsmod

Displays a list of loaded kernel modules along with their usage count and dependencies.

## Output Explanation

- Module: Name of the kernel module  
- Size: Memory used by the module  
- Used by: Number of dependent modules

## Use Cases

- Check which drivers are currently loaded
- Identify unused or unnecessary modules
- Investigate dependency relationships between modules
- Troubleshoot driver-related issues

## Practical Insight

A module with a usage count of 0 may be safe to remove,  
but dependencies must be checked before unloading.

## Summary

`lsmod` is a key command for understanding the current state of kernel modules and system drivers.
