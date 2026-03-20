## 5. dmesg command

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
| -l | Filter by log level (err, warn, info) |
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

## 6. journalctl (Kernel Logs)

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
