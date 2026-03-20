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
