# System Operations (Linux)

This document summarizes essential Linux commands for system power control  
and service management in practical environments.

---

## 1. shutdown command

### Overview
`shutdown` is used to safely power off or reboot a Linux system.  
It notifies logged-in users and allows processes to terminate gracefully.

### Syntax
shutdown [OPTION] [TIME] [MESSAGE]

### Examples

$ sudo shutdown now  
→ Shutdown immediately  

$ sudo shutdown +10  
→ Shutdown after 10 minutes  

$ sudo shutdown -r now  
→ Reboot immediately  

$ sudo shutdown -c  
→ Cancel scheduled shutdown  

### Use Cases

- Schedule system maintenance
- Safely shut down servers
- Notify users before downtime

### Practical Insight

`shutdown` is useful in multi-user environments where advance notice  
is required before stopping the system.

---

## 2. systemctl (Power Management)

### Overview
`systemctl` controls the systemd system and service manager.  
It is the standard tool for managing system power in modern Linux systems.

### Examples

$ sudo systemctl poweroff  
→ Power off system  

$ sudo systemctl reboot  
→ Reboot system  

$ sudo systemctl halt  
→ Halt system  

### Practical Insight

Unlike `shutdown`, `systemctl` executes commands immediately  
and is commonly used in scripts and automation.

---

## 3. systemctl (Service Management)

### Overview
`systemctl` is also used to manage system services (daemons).

### Syntax
systemctl [COMMAND] [SERVICE]

### Examples

#### Check service status
$ systemctl status nginx

#### Start a service
$ sudo systemctl start nginx

#### Stop a service
$ sudo systemctl stop nginx

#### Restart a service
$ sudo systemctl restart nginx

#### Enable service at boot
$ sudo systemctl enable nginx

#### Disable service
$ sudo systemctl disable nginx

### Use Cases

- Manage web servers, databases, and system services
- Control service startup behavior
- Troubleshoot service failures

### Practical Insight

Checking `systemctl status` is the first step when a service fails.  
Enabling services ensures they start automatically after reboot.

---

## Comparison

| Command | Purpose |
|--------|--------|
| shutdown | Scheduled shutdown with user notification |
| systemctl | Direct system and service control |

### Key Difference

- `shutdown` → scheduling & notification  
- `systemctl` → real-time control & automation  

---

## Practical Workflow

### System maintenance example

1. Notify users  
   → `shutdown +10 "Maintenance in 10 minutes"`

2. Cancel if needed  
   → `shutdown -c`

3. Stop services  
   → `systemctl stop nginx`

4. Reboot system  
   → `systemctl reboot`

---

## Summary

Understanding both `shutdown` and `systemctl` is essential  
for safe and efficient Linux system administration.

These commands enable proper system control, service management,  
and reliable operation in production environments.
### Note

Administrative privileges are required to execute this command.

In many textbooks and certification materials, commands are shown with a `#` prompt,  
which indicates execution as the root user.

In practical environments, it is common to use `sudo` instead:

$ sudo shutdown -h +5
