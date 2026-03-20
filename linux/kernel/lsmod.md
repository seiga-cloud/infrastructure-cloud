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
