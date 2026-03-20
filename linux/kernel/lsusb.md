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
