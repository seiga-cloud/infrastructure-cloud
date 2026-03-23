# Boot Management (GRUB)

This document covers essential commands for managing the GRUB bootloader  
in Linux systems.

---

## 1. grub-install command

### Overview
`grub-install` installs the GRUB bootloader to a specified device.  
It is typically used when setting up a system or recovering from boot failures.

### Syntax
grub-install [OPTION] <device>

### Examples

#### Install GRUB to disk
$ sudo grub-install /dev/sda

Installs GRUB to the primary disk.

#### Reinstall GRUB (recovery)
$ sudo grub-install --recheck /dev/sda

Rechecks device mappings and reinstalls GRUB.

### Use Cases

- Initial system setup
- Recovering from bootloader corruption
- Fixing boot issues after disk changes

### Practical Insight

`grub-install` writes bootloader code to the disk (MBR or EFI).  
Running this command incorrectly may affect system bootability.

---

## 2. grub-mkconfig command

### Overview
`grub-mkconfig` generates the GRUB configuration file based on system settings.  
It detects installed kernels and operating systems automatically.

### Syntax
grub-mkconfig -o <output_file>

### Examples

#### Generate GRUB configuration
$ sudo grub-mkconfig -o /boot/grub/grub.cfg

Creates or updates the GRUB configuration file.

### Use Cases

- Update boot menu after kernel installation
- Apply changes in GRUB settings
- Reflect system configuration updates

### Practical Insight

After installing or updating GRUB, it is necessary to regenerate  
the configuration file to apply changes.

---

## Workflow (Bootloader Management)

1. Install or repair GRUB  
   → `grub-install /dev/sda`

2. Generate configuration file  
   → `grub-mkconfig -o /boot/grub/grub.cfg`

This workflow ensures that the system boots correctly with updated settings.

---

## Important Notes

- Administrative privileges are required (`sudo`)
- Incorrect device selection may cause boot failure
- On UEFI systems, installation targets may differ (e.g., EFI partition)

---

## Summary

`grub-install` and `grub-mkconfig` are essential commands  
for managing and recovering the GRUB bootloader.

Understanding these commands is critical for system recovery  
and boot troubleshooting in Linux environments.

Note: On some distributions, `update-grub` is a wrapper for `grub-mkconfig`.
